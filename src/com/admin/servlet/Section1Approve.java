package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.impl.AdminDaoImpl;
import com.dao.impl.ApiController;

/**
 * Servlet implementation class Section1Approve
 */
@WebServlet("/Section1Approve")
public class Section1Approve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Section1Approve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String status=request.getParameter("status");
		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
		int section_status=1;
	    if(status.equalsIgnoreCase("2")) {
	    	section_status=2;
	    }
		int i=adminDaoImpl.ApprovedSection1(id,status,section_status);
		String pageurl = request.getRequestURL().toString();
    	String baseURL = pageurl.substring(0, pageurl.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
    	String userurl=baseURL+"userLogin";
    	ApiController apiController=new ApiController();
    	String email=adminDaoImpl.getUserEmail(id);
		if(status.equalsIgnoreCase("2")) {
			apiController.sendMailForSecondRound(userurl, "You are selected for second around", email);
	    }else {
	    	apiController.sendMailForSecondRound(userurl, "Sorry! You are decline for second around", email);
	    }
		if(i>0) {
			response.sendRedirect("amountTransfer?clr=app_section2&act=app_section2&message="+status+"");
		}else {
			response.sendRedirect("amountTransfer?clr=app_section2&act=app_section2&message=0");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
