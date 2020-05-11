package com.servlet.judges;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserRatingBeans;
import com.dao.impl.AdminDaoImpl;

/**
 * Servlet implementation class CommentSection3ByJudges
 */
@WebServlet("/CommentSection3ByJudges")
public class CommentSection3ByJudges extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentSection3ByJudges() {
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
		beans.setJudgeid(Integer.parseInt(request.getParameter("judges_id")));
		beans.setUserid(Integer.parseInt(request.getParameter("userid")));
		beans.setRating(request.getParameter("selected_rating"));
		beans.setComment(request.getParameter("comment"));
		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
		int id=adminDaoImpl.checkUserRatingSection3(beans);
		System.out.println("idididididididididididididididid"+id);
		int i=0;
		if(id>0){
			beans.setId(id);
			i=adminDaoImpl.UpdateRatingSection3(beans);
		}else {
			i=adminDaoImpl.InsertRatingSection3(beans);
		}
		if(i>0) {
			response.sendRedirect("judgesSection3?clr=app_section3&act=app_section3&message=1");
		}else {
			response.sendRedirect("judgesSection3?clr=app_section3&act=app_section3&message=0");
		}
		
	}

}
