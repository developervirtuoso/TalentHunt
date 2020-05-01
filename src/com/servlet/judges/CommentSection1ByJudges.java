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
 * Servlet implementation class CommentSection1ByJudges
 */
@WebServlet("/CommentSection1ByJudges")
public class CommentSection1ByJudges extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentSection1ByJudges() {
        super();
    }
    protected void processor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserRatingBeans beans=new UserRatingBeans();
		beans.setJudgeid(Integer.parseInt(request.getParameter("judges_id")));
		beans.setUserid(Integer.parseInt(request.getParameter("userid")));
		beans.setRating(request.getParameter("selected_rating"));
		beans.setComment(request.getParameter("comment"));
		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
		int id=adminDaoImpl.checkUserRatingSection1(beans);
		int i=0;
		if(id>0){
			beans.setId(id);
			i=adminDaoImpl.UpdateRatingSection1(beans);
		}else {
			i=adminDaoImpl.InsertRatingSection1(beans);
		}
		if(i>0) {
			response.sendRedirect("judgesSection1?clr=appLanguages&act=appLanguages1&message=1");
		}else {
			response.sendRedirect("judgesSection1?clr=appLanguages&act=appLanguages1&message=0");
		}
		
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processor(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processor(request, response);
	}

}
