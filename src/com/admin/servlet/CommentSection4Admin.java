package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserRatingBeans;
import com.dao.impl.AdminDaoImpl;
import com.dao.impl.ApiController;

/**
 * Servlet implementation class CommentSection4Admin
 */
@WebServlet("/CommentSection4Admin")
public class CommentSection4Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentSection4Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserRatingBeans beans=new UserRatingBeans();
		beans.setAdminid(Integer.parseInt(request.getParameter("adminid")));
		beans.setUserid(Integer.parseInt(request.getParameter("userid")));
		beans.setRating(request.getParameter("selected_rating"));
		beans.setComment(request.getParameter("comment"));
		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
		int id=adminDaoImpl.checkUserRatingSection4(beans);
		int i=0;
		if(id>0){
			beans.setId(id);
			i=adminDaoImpl.UpdateRatingSection4(beans);
		}else {
			i=adminDaoImpl.InsertRatingSection4(beans);
		}
		String status=request.getParameter("status");
		String userid=request.getParameter("userid");
		int section_status=4;
	    if(status.equalsIgnoreCase("2")) {
	    	section_status=5;
	    }
	    int statusi=adminDaoImpl.ApprovedSection4(userid,status,section_status);
	    String pageurl = request.getRequestURL().toString();
    	String baseURL = pageurl.substring(0, pageurl.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
    	String userurl=baseURL+"userLogin";
    	ApiController apiController=new ApiController();
    	String email=adminDaoImpl.getUserEmail(userid);
    	if(status.equalsIgnoreCase("2")) {
			apiController.sendMailForSecondRound(userurl, "You are selected for Fourth around", email);
	    }else {
	    	apiController.sendMailForSecondRound(userurl, "Sorry! You are decline for Fourth around", email);
	    }
		if(i>0) {
			response.sendRedirect("Section4ByAdmin?clr=app_section4&act=app_section4&message=1");
		}else {
			response.sendRedirect("Section4ByAdmin?clr=app_section4&act=app_section4&message=0");
		}
		
	}

}
