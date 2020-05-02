package com.user.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.PaymentDetailsBeans;
import com.dao.impl.AdminDaoImpl;

/**
 * Servlet implementation class UserPayment
 */
@WebServlet("/UserPayment")
public class UserPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPayment() {
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
		PaymentDetailsBeans paymentDetailsBeans=new PaymentDetailsBeans();
		paymentDetailsBeans.setAmount(request.getParameter("amount"));
		paymentDetailsBeans.setPayment_by(request.getParameter("payment_by"));
		paymentDetailsBeans.setTransition_id(request.getParameter("transition_id"));
		paymentDetailsBeans.setStatus(2);		
		paymentDetailsBeans.setUserid(Integer.parseInt(request.getParameter("userid")));
		String date=LocalDate.now().toString();
		paymentDetailsBeans.setDate(date);
		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
		int i=adminDaoImpl.insertPaymentDetalis(paymentDetailsBeans);
		response.sendRedirect("userLoginSection2?clr=section2&actsection2");
	}

}
