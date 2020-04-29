package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.impl.AdminDaoImpl;

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
		int i=adminDaoImpl.ApprovedSection1(id,status);
		if(i>0) {
			response.sendRedirect("userManagementList?clr=appLanguages&act=appLanguages1&message="+status+"");
		}else {
			response.sendRedirect("userManagementList?clr=appLanguages&act=appLanguages1&message=0");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
