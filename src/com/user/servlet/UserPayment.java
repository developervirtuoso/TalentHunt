package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.PaymentDetailsBeans;
import com.dao.impl.AdminDaoImpl;
import com.dao.impl.StripeService;
import com.stripe.model.Charge;

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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		PaymentDetailsBeans paymentDetailsBeans=new PaymentDetailsBeans();
	
		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
		StripeService stripeService=new StripeService();
		String token = request.getParameter("stripeToken");
	        Double amount = Double.parseDouble(request.getParameter("amount"));
	        Charge charge= stripeService.chargeNewCard(token, amount);
	    	paymentDetailsBeans.setAmount(amount+"");
			paymentDetailsBeans.setPayment_by("card");
			//paymentDetailsBeans.setStatus(2);		
			paymentDetailsBeans.setUserid(Integer.parseInt(request.getParameter("userid")));
			String date=LocalDate.now().toString();
			paymentDetailsBeans.setDate(date);
			paymentDetailsBeans.setToken(token);
			paymentDetailsBeans.setPaymentid(charge.getId());
			paymentDetailsBeans.setTransition_id(charge.getBalanceTransaction());
			paymentDetailsBeans.setCurrency(charge.getCurrency());
			paymentDetailsBeans.setStripeStatus(charge.getStatus());
			paymentDetailsBeans.setPaymentMethod(charge.getPaymentMethod());
			
	       /* System.out.println("token = "+token);
	        System.out.println("amount = "+amount);
	        System.out.println("getApplication = "+charge.getApplication());
	        System.out.println("getId = "+charge.getId());
	        System.out.println("getAuthorizationCode = "+charge.getAuthorizationCode());
	        System.out.println("getBalanceTransaction = "+charge.getBalanceTransaction());
	        System.out.println("getCurrency = "+charge.getCurrency());
	        System.out.println("getStatus = "+charge.getStatus());
	        System.out.println("getCustomer = "+charge.getCustomer());
	        System.out.println("getPaymentMethod = "+charge.getPaymentMethod());
	        System.out.println("getReceiptEmail = "+charge.getReceiptEmail());
	        System.out.println("getReview = "+charge.getReview());
	        System.out.println("getStatementDescriptor = "+charge.getStatementDescriptor());
	        System.out.println("getReceiptEmail = "+charge.getReceiptEmail());*/
		int i=adminDaoImpl.insertPaymentDetalis(paymentDetailsBeans);
		response.sendRedirect("userLoginSection2?clr=section2&actsection2");
	}

}
