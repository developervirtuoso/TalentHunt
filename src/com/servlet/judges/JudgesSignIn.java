package com.servlet.judges;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.beans.JudgesBBeans;
import com.dao.impl.AdminDaoImpl;
import com.dao.impl.ApiController;

/**
 * Servlet implementation class JudgesSignIn
 */
@WebServlet("/JudgesSignIn")
public class JudgesSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JudgesSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }
    final static Logger logger = Logger.getLogger(JudgesSignIn.class);
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String  browserDetails  =   request.getHeader("User-Agent");
        String  userAgent       =   browserDetails;
        String  user            =   userAgent.toLowerCase();
        String os = "";
        String browser = "";
        //=================OS=======================
         if (userAgent.toLowerCase().indexOf("windows") >= 0 )
         {
             os = "Windows";
         } else if(userAgent.toLowerCase().indexOf("mac") >= 0)
         {
             os = "Mac";
         } else if(userAgent.toLowerCase().indexOf("x11") >= 0)
         {
             os = "Unix";
         } else if(userAgent.toLowerCase().indexOf("android") >= 0)
         {
             os = "Android";
         } else if(userAgent.toLowerCase().indexOf("iphone") >= 0)
         {
             os = "IPhone";
         }else{
             os = "UnKnown, More-Info: "+userAgent;
         }
         //===============Browser===========================
        if (user.contains("msie"))
        {
            String substring=userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
            browser=substring.split(" ")[0].replace("MSIE", "IE")+"-"+substring.split(" ")[1];
        } else if (user.contains("safari") && user.contains("version"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Safari")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
        } else if ( user.contains("opr") || user.contains("opera"))
        {
            if(user.contains("opera"))
                browser=(userAgent.substring(userAgent.indexOf("Opera")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
            else if(user.contains("opr"))
                browser=((userAgent.substring(userAgent.indexOf("OPR")).split(" ")[0]).replace("/", "-")).replace("OPR", "Opera");
        } else if (user.contains("chrome"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
        } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1)  || (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1) )
        {
            //browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/", "-");
            browser = "Netscape-?";
        } else if (user.contains("firefox"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
        } else if(user.contains("rv"))
        {
            browser="IE-" + user.substring(user.indexOf("rv") + 3, user.indexOf(")"));
        } else
        {
            browser = "UnKnown, More-Info: "+userAgent;
        }
       String publicip=request.getParameter("publicip");
       JudgesBBeans beans = new JudgesBBeans();
        AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
        ApiController apiController=new ApiController();
        logger.info("111111111111");
        int id=0;
        Boolean status = false;
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String encrypass = apiController.encrypt(password) ;
        beans.setEmail(email);
        beans.setPassword(encrypass);
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a");
        String logintime = String.valueOf(sdf.format(cal.getTime()));
        try {
        	logger.info("2222222222222");
      	status = adminDaoImpl.checkJudgesLogin(beans);
      	logger.info("33333333333");
        	id = beans.getId();
        	email = beans.getEmail();
        	password = beans.getPassword();
        	 if (status == true) {
        		 //adminDaoImpl.logTimingDetails(id, logintime);
        		 adminDaoImpl.InsertLoggingLog(os,browser,"0",id,publicip);
                 HttpSession session = request.getSession();
                 session.setAttribute("judges_id", id);
                 session.setAttribute("judges_email", email);
                 session.setAttribute("judges_password", password);
                 session.setAttribute("judges_authkey", beans.getAuthkey());
                 session.setAttribute("judges_name", beans.getName());
                 response.sendRedirect("judgesSection1?clr=appLanguages&act=appLanguages1");
               out.println("</body>");
               out.println("</html>");
        	 }else{ 
        		 status = false;
        		 String message = "Login Failed,Please try again!";
        		 request.setAttribute("message", message);
        		request.getRequestDispatcher("judgesLogin?message=invalid email and password&type=HR").include(request, response);
                   out.println("</body>");
                   out.println("</html>");
        	 }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
