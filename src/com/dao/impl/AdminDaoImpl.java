package com.dao.impl;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import org.json.JSONObject;

import com.admin.servlet.CountByAdminBeans;
import com.beans.Admin;
import com.beans.CountUserDetailsBeans;
import com.beans.JudgesBBeans;
import com.beans.PaymentDetailsBeans;
import com.beans.UserRatingBeans;
import com.beans.Userbeans;
import common.database.DbConnection;
public class AdminDaoImpl {
	public static void main(String[] args) {
		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
		 Userbeans userbeans=new Userbeans();
         userbeans=adminDaoImpl.getUserDetails("4");
         System.out.println(userbeans.getFilename());
	}
	public Boolean checkAdmin(Admin admin){ 
		 String password;
		 String email;
		 Boolean status =false;
		 int count=0;
		 int id=0;
		 Connection conn=DbConnection.getInstance().getConnection();
		 Statement stmt=null;
		 Statement stmt1=null;
		 ResultSet rs = null;
		 ResultSet rs1 = null;
	   	 email = admin.getEmail();
	   	 password =admin.getPassword();
	   	  try {
	         	stmt=conn.createStatement();
	         	String query = "select count(*) from admin where email='"+email+"' and password='"+password+"'";
	         	System.out.println("query="+query);
	         	rs = stmt.executeQuery(query);
	         	 while (rs.next()) {
	         		 count=rs.getInt(1);
	         	 }
	         		 if(count!=0){
	         			stmt1=conn.createStatement();
	         			String query1 = "select * from admin where email='"+email+"' and password='"+password+"'";
	         			rs1 = stmt1.executeQuery(query1);
	                	 while (rs1.next()) {
	                		 id=rs1.getInt("id");
	                		 email=rs1.getString("email");
	                		 password=rs1.getString("password");
	                		 admin.setId(id);
	                		 admin.setEmail(email);
	                		 admin.setPassword(password);
	                		 admin.setAuthkey(rs1.getString("authkey"));
	                		 admin.setName(rs1.getString("name"));
	         		 status=true;
	                	 }
	         		 }else{
	         			 status=false;
	         		 }
	    			conn.close();
	         } catch (Exception e) {
	             e.printStackTrace();
	         }finally
	         {
	        	 try {
	        	         if (conn != null)
	        	      	conn.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	      try {
	        	         if (stmt != null)
	        	             stmt.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	   try {
	        	         if (stmt1 != null)
	        	        	 stmt1.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	   try {
	        	         if (rs != null)
	        	        	 rs.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	   try {
	        	         if (rs1 != null)
	        	        	 rs1.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	 }
	     return status; 
	   }
	public Boolean checkJudgesLogin(JudgesBBeans beans){ 
		 String password;
		 String email;
		 Boolean status =false;
		 int count=0;
		 int id=0;
		 Connection conn=DbConnection.getInstance().getConnection();
		 Statement stmt=null;
		 Statement stmt1=null;
		 ResultSet rs = null;
		 ResultSet rs1 = null;
	   	 email = beans.getEmail();
	   	 password =beans.getPassword();
	   	  try {
	         	stmt=conn.createStatement();
	         	String query = "select count(*) from judges where email='"+email+"' and password='"+password+"'";
	         	System.out.println("query="+query);
	         	rs = stmt.executeQuery(query);
	         	 while (rs.next()) {
	         		 count=rs.getInt(1);
	         	 }
	         		 if(count!=0){
	         			stmt1=conn.createStatement();
	         			String query1 = "select * from judges where email='"+email+"' and password='"+password+"'";
	         			rs1 = stmt1.executeQuery(query1);
	                	 while (rs1.next()) {
	                		 id=rs1.getInt("id");
	                		 email=rs1.getString("email");
	                		 password=rs1.getString("password");
	                		 beans.setId(id);
	                		 beans.setEmail(email);
	                		 beans.setPassword(password);
	                		 beans.setAuthkey(rs1.getString("authkey"));
	                		 beans.setName(rs1.getString("name"));
	         		 status=true;
	                	 }
	         		 }else{
	         			 status=false;
	         		 }
	    			conn.close();
	         } catch (Exception e) {
	             e.printStackTrace();
	         }finally
	         {
	        	 try {
	        	         if (conn != null)
	        	      	conn.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	      try {
	        	         if (stmt != null)
	        	             stmt.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	   try {
	        	         if (stmt1 != null)
	        	        	 stmt1.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	   try {
	        	         if (rs != null)
	        	        	 rs.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	   try {
	        	         if (rs1 != null)
	        	        	 rs1.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	 }
	     return status; 
	   }
	public Boolean checkUser(Userbeans userbeans){ 
		 String password;
		 String email;
		 Boolean status =false;
		 int count=0;
		 int id=0;
		 Connection conn=DbConnection.getInstance().getConnection();
		 Statement stmt=null;
		 Statement stmt1=null;
		 ResultSet rs = null;
		 ResultSet rs1 = null;
	   	 email = userbeans.getEmail();
	   	 password =userbeans.getPassword();
	   	 System.out.println(password);
	   	  try {
	         	stmt=conn.createStatement();
	         	String query = "select count(*) from user where email='"+email+"' and password='"+password+"'";
	         	System.out.println(query);
	         	rs = stmt.executeQuery(query);
	         	 while (rs.next()) {
	         		 count=rs.getInt(1);
	         	 }
	         		 if(count!=0){
	         			stmt1=conn.createStatement();
	         			String query1 = "select * from user where email='"+email+"' and password='"+password+"'";
	         			rs1 = stmt1.executeQuery(query1);
	                	 while (rs1.next()) {
	                		 id=rs1.getInt("id");
	                		 email=rs1.getString("email");
	                		 password=rs1.getString("password");
	                		 userbeans.setId(id);
	                		 userbeans.setEmail(email);
	                		 userbeans.setPassword(password);
	                		 userbeans.setUsername(rs1.getString("username"));
	                		 userbeans.setTicketid(rs1.getString("ticketid"));
	                		 userbeans.setPhoneno(rs1.getString("phoneno"));
	                		 userbeans.setDob(rs1.getString("dob"));
	                		 userbeans.setGender(rs1.getString("gender"));
	                		 userbeans.setCat(rs1.getString("cat"));
	                		 userbeans.setFilename(rs1.getString("filename"));
	                		 userbeans.setFile(rs1.getString("file"));
	                		 userbeans.setSection_status(rs1.getInt("section_status"));
	         		 status=true;
	                	 }
	         		 }else{
	         			 status=false;
	         		 }
	    			conn.close();
	         } catch (Exception e) {
	             e.printStackTrace();
	         }finally
	         {
	        	 try {
	        	         if (conn != null)
	        	      	conn.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	      try {
	        	         if (stmt != null)
	        	             stmt.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	   try {
	        	         if (stmt1 != null)
	        	        	 stmt1.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	   try {
	        	         if (rs != null)
	        	        	 rs.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	   try {
	        	         if (rs1 != null)
	        	        	 rs1.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	 }
	     return status; 
	   }
	public void InsertLoggingLog(String os, String browser, String type, int id, String publicip) {
		Thread thread = new Thread(){
		    public void run(){
		    	JSONObject jsonObjectip=new JSONObject();
				AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
				try {
					adminDaoImpl.getSystemAndPublicIP(jsonObjectip);
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
		    	String systemip=jsonObjectip.getString("systemip");
		    	adminDaoImpl.insertLoggingLogsDetails(os,browser,type,id,systemip,publicip);
		    }
		  };
		  thread.start();
	}
			public void getSystemAndPublicIP(JSONObject jsonObject) throws UnknownHostException {
			InetAddress localhost = InetAddress.getLocalHost(); 
	        System.out.println("System IP Address : " + (localhost.getHostAddress()).trim()); 
	        jsonObject.put("systemip", (localhost.getHostAddress()).trim()+"");
		        // Find public IP address 
		        String publicipaddress = ""; 
		        try
		        { 
		            URL url_name = new URL("http://bot.whatismyipaddress.com"); 
		            BufferedReader sc = 
		            new BufferedReader(new InputStreamReader(url_name.openStream())); 
		            // reads system IPAddress 
		            publicipaddress = sc.readLine().trim(); 
		        } 
		        catch (Exception e) 
		        { 
		        	publicipaddress = "Cannot Execute Properly"; 
		        } 
		        System.out.println("Public IP Address: " + publicipaddress +"\n"); 
		        jsonObject.put("publicip", publicipaddress);
		}
			public void insertLoggingLogsDetails(String os, String browser, String type, int id, String systemip, String publicip) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into LoggingLog (os,browser,systemip,publicip,logintype,loginid) values(?,?,?,?,?,?)");
					  pst.setString(1, os);
					  pst.setString(2, browser);
					  pst.setString(3, systemip);
					  pst.setString(4, publicip);
					  pst.setInt(5, Integer.parseInt(type));
					  pst.setInt(6, id);
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						// TODO: handle exception
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						// TODO: handle exception
					}
				}
			}
			public ArrayList<Userbeans> getUserList(String sql) {
				ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		 Userbeans userbeans=new Userbeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("filename"));
		      		userbeans.setFile(rs.getString("file"));
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("status"));
		      		 userbeans.setRatingCount(rs.getInt("rating_count"));
		      		 userbeanss.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeanss;
			}
			public ArrayList<Userbeans> getUserListForFour(String sql) {
				ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		 Userbeans userbeans=new Userbeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("filename"));
		      		userbeans.setFile(rs.getString("file"));
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("around4"));
		      		 userbeanss.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeanss;
			}
			public ArrayList<Userbeans> getUserListForThree(String sql) {
				ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		 Userbeans userbeans=new Userbeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("filename"));
		      		userbeans.setFile(rs.getString("file"));
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("around3"));
		      		 userbeans.setRatingCount(rs.getInt("rating_count"));
		      		 userbeanss.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeanss;
			}
			public ArrayList<Userbeans> getUserListForSecond(String sql) {
				ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		 Userbeans userbeans=new Userbeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("filename"));
		      		userbeans.setFile(rs.getString("file"));
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("around2"));
		      		 userbeans.setRatingCount(rs.getInt("rating_count"));
		      		 userbeans.setPaymentCount(rs.getInt("payment_count"));
		      		 userbeanss.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeanss;
			}
			public ArrayList<Userbeans> getUserListForThreeByjudges(String sql) {
				ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		 Userbeans userbeans=new Userbeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("filename"));
		      		userbeans.setFile(rs.getString("file"));
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("around3"));
		      		 userbeanss.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeanss;
			}
			public ArrayList<Userbeans> getUserListForSecondByjudges(String sql) {
				ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		 Userbeans userbeans=new Userbeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("filename"));
		      		userbeans.setFile(rs.getString("file"));
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("around2"));
		      		 userbeanss.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeanss;
			}
			public ArrayList<UserRatingBeans> getUserRatingSection4(String sql) {
				ArrayList<UserRatingBeans> userbeanss=new ArrayList<UserRatingBeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		UserRatingBeans userbeans=new UserRatingBeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUserName(rs.getString("username"));
		      		 userbeans.setRating(rs.getString("rating"));
		      		 userbeans.setUserid(rs.getInt("userid"));
		      		userbeans.setComment(rs.getString("comment"));
		      		userbeans.setStatus(rs.getInt("status"));
		      		 userbeanss.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeanss;
			}
			public ArrayList<UserRatingBeans> getUserRatingSection1(String sql) {
				ArrayList<UserRatingBeans> userbeanss=new ArrayList<UserRatingBeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		UserRatingBeans userbeans=new UserRatingBeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUserName(rs.getString("username"));
		      		 userbeans.setRating(rs.getString("rating"));
		      		 userbeans.setUserid(rs.getInt("userid"));
		      		 userbeans.setJudgeid(rs.getInt("judgeid"));
		      		 userbeans.setJadgename(rs.getString("judges_name"));
		      		 userbeans.setComment(rs.getString("comment"));
		      		userbeans.setStatus(rs.getInt("status"));
		      		 userbeanss.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeanss;
			}
			public ArrayList<PaymentDetailsBeans> getUserPaymentDetails(String sql) {
				ArrayList<PaymentDetailsBeans> paymentDetailsBeans=new ArrayList<PaymentDetailsBeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		PaymentDetailsBeans userbeans=new PaymentDetailsBeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setAmount(rs.getString("amount"));
		      		 userbeans.setStatus(rs.getInt("status"));
		      		 userbeans.setUserid(rs.getInt("userid"));
		      		 userbeans.setDate(rs.getString("date"));
		      		 userbeans.setPayment_by(rs.getString("payment_by"));
		      		 userbeans.setTransition_id(rs.getString("transition_id"));
		      		userbeans.setDatetime(rs.getString("datetime"));
		      		paymentDetailsBeans.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return paymentDetailsBeans;
			}
			public ArrayList<PaymentDetailsBeans> getUserPaymentDetailsWithUsername(String sql) {
				ArrayList<PaymentDetailsBeans> paymentDetailsBeans=new ArrayList<PaymentDetailsBeans>();
		        boolean check = false;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		PaymentDetailsBeans userbeans=new PaymentDetailsBeans();
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setAmount(rs.getString("amount"));
		      		 userbeans.setStatus(rs.getInt("status"));
		      		 userbeans.setUserid(rs.getInt("userid"));
		      		 userbeans.setDate(rs.getString("date"));
		      		 userbeans.setPayment_by(rs.getString("payment_by"));
		      		 userbeans.setTransition_id(rs.getString("transition_id"));
		      		userbeans.setDatetime(rs.getString("datetime"));
		      		userbeans.setUsername(rs.getString("username"));
		      		paymentDetailsBeans.add(userbeans);
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return paymentDetailsBeans;
			}
			public int getCountBySql(String sql) {
				int count =0;
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery(sql);
		      	 while(rs.next())
		      	 {
		      		count=rs.getInt(1); 
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return count;
			}
			public Userbeans getUserDetails(String id) {
				Userbeans userbeans=new Userbeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("select * from user where id="+id+"");
		      	 while(rs.next())
		      	 {
		      		 System.out.println(rs.getString("filename"));
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("filename"));
		      		userbeans.setFile(rs.getString("file"));
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("status"));
		      		 
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeans;
			}
			public Userbeans getUserDetailsWithSection4(String id) {
				Userbeans userbeans=new Userbeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("select user.*,file_section4.file_name AS filename4,file_section4.itemName AS itemname4,file_section4.STATUS AS STATUS4 from user LEFT JOIN file_section4 ON file_section4.userid=user.id where user.id="+id+"");
		      	 while(rs.next())
		      	 {
		      		 System.out.println(rs.getString("filename"));
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("itemname4")+"");
		      		userbeans.setFile(rs.getString("filename4")+"");
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("around4"));
		      		 
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeans;
			}
			public Userbeans getUserDetailsWithSection3(String id) {
				Userbeans userbeans=new Userbeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("select user.*,file_section3.file_name AS filename3,file_section3.itemName AS itemname3,file_section3.STATUS AS STATUS3 from user LEFT JOIN file_section3 ON file_section3.userid=user.id where user.id="+id+"");
		      	 while(rs.next())
		      	 {
		      		 System.out.println(rs.getString("filename"));
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("itemname3")+"");
		      		userbeans.setFile(rs.getString("filename3")+"");
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("around3"));
		      		 
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeans;
			}
			
			public Userbeans getUserDetailsWithSection2(String id) {
				Userbeans userbeans=new Userbeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("select user.*,file_section2.file_name AS filename2,file_section2.itemName AS itemname2,file_section2.STATUS AS STATUS2 from user LEFT JOIN file_section2 ON file_section2.userid=user.id where user.id="+id+"");
		      	 while(rs.next())
		      	 {
		      		 System.out.println(rs.getString("filename"));
		      		 userbeans.setId(rs.getInt("id"));
		      		 userbeans.setUsername(rs.getString("username"));
		      		 userbeans.setTicketid(rs.getString("ticketid"));
		      		 userbeans.setEmail(rs.getString("email"));
		      		 userbeans.setPhoneno(rs.getString("phoneno"));
		      		 userbeans.setDob(rs.getString("dob"));
		      		 userbeans.setGender(rs.getString("gender"));
		      		userbeans.setFilename(rs.getString("itemname2")+"");
		      		userbeans.setFile(rs.getString("filename2")+"");
		      		userbeans.setCat(rs.getString("cat"));
		      		 userbeans.setStatus(rs.getInt("around2"));
		      		 
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeans;
			}
			public UserRatingBeans getUserRating4ByAdminID(String id,String adminid) {
				UserRatingBeans userRatingBean=new UserRatingBeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        String rating ="0";
		        String comment="";
		        
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("SELECT *  FROM user_rating_section4 WHERE userid="+id+" AND adminid="+adminid+";");
		      	 while(rs.next())
		      	 {
		      		rating=rs.getString("rating");
		      		comment=rs.getString("comment");
		      		
		      	 }
		      	 userRatingBean.setRating(rating);
		      	 userRatingBean.setComment(comment);
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userRatingBean;
			}
			public UserRatingBeans getUserRating3ByjudgesID(String id,String judgeid) {
				UserRatingBeans userRatingBean=new UserRatingBeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        String rating ="0";
		        String comment="";
		        
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("SELECT *  FROM user_rating_section3 WHERE userid="+id+" AND judgeid="+judgeid+";");
		      	 while(rs.next())
		      	 {
		      		rating=rs.getString("rating");
		      		comment=rs.getString("comment");
		      		
		      	 }
		      	 userRatingBean.setRating(rating);
		      	 userRatingBean.setComment(comment);
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userRatingBean;
			}
			public void getAdminVideo(JSONObject jsonObject, String userid) {
				Userbeans userbeans=new Userbeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        boolean status=false;
		        String itemName="";
		        String filename="";
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("SELECT * FROM adminvideo WHERE userid="+userid+";");
		      	 while(rs.next())
		      	 {
		      		itemName= rs.getString("itemName");
		      		filename= rs.getString("file_name");
		      		status=true;
		      	 }
		      	 
		      	jsonObject.put("itemName", itemName);
		      	jsonObject.put("filename", filename);
		      	jsonObject.put("status", status);
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				
			}
			public Userbeans getUploadFileSection4(String id) {
				Userbeans userbeans=new Userbeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("SELECT file_section4.*,user_video.file_name AS ownfilename,user_video.itemName AS ownitem,user_family_video.file_name AS familyfilename,user_family_video.itemName AS familyitem from file_section4 \r\n" + 
		      	 		"LEFT JOIN user_video on user_video.userid=file_section4.userid \r\n" + 
		      	 		"LEFT join user_family_video on user_family_video.userid=file_section4.userid where file_section4.userid="+id+"");
		      	 while(rs.next())
		      	 {
		      		userbeans.setFilename(rs.getString("itemName"));
		      		userbeans.setFile(rs.getString("file_name"));
		      		 userbeans.setStatus(rs.getInt("status"));
		      		 userbeans.setOwnfilename(rs.getString("ownfilename"));
		      		 userbeans.setOwnitem(rs.getString("ownitem"));
		      		 userbeans.setFamilyfilename(rs.getString("familyfilename"));
		      		 userbeans.setFamilyitem(rs.getString("familyitem"));
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeans;
			}
			public Userbeans getUploadFileSection3(String id) {
				Userbeans userbeans=new Userbeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("select * from file_section3 where userid="+id+"");
		      	 while(rs.next())
		      	 {
		      		userbeans.setFilename(rs.getString("itemName"));
		      		userbeans.setFile(rs.getString("file_name"));
		      		 userbeans.setStatus(rs.getInt("status"));
		      		 
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeans;
			}
			public Userbeans getUploadFileSection2(String id) {
				Userbeans userbeans=new Userbeans();
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("select * from file_section2 where userid="+id+"");
		      	 while(rs.next())
		      	 {
		      		userbeans.setFilename(rs.getString("itemName"));
		      		userbeans.setFile(rs.getString("file_name"));
		      		 userbeans.setStatus(rs.getInt("status"));
		      		 
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return userbeans;
			}
			public String getUserEmail(String id) {
				String email="";
		        Connection conn=DbConnection.getInstance().getConnection();
		         Statement st=null;
		        ResultSet rs=null;
		        try
		        {
		     	 st=conn.createStatement();
		      	 rs = st.executeQuery("select * from user where id="+id+"");
		      	 while(rs.next())
		      	 {
		      		email=rs.getString("email");
		      		 
		      	 }
		        }
		       catch(Exception e)
		        {
		     	  e.printStackTrace();
		        }finally {
					try {
						if(conn!=null) {
							conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return email;
			}
			public int ApprovedSection1(String id, String status, int section_status) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
			    
				try 
				{
					pst=Conn.prepareStatement("UPDATE user SET STATUS="+status+",section_status="+section_status+" WHERE id="+id+";");
					  
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int ApprovedSection3(String id, String status, int section_status) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
			    
				try 
				{
					pst=Conn.prepareStatement("UPDATE user SET around3="+status+",section_status="+section_status+" WHERE id="+id+";");
					  
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int ApprovedSection4(String id, String status, int section_status) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
			    
				try 
				{
					pst=Conn.prepareStatement("UPDATE user SET around4="+status+",section_status="+section_status+" WHERE id="+id+";");
					  
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int ApprovedSection2(String id, String status, int section_status) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
			    
				try 
				{
					pst=Conn.prepareStatement("UPDATE user SET around2="+status+",section_status="+section_status+" WHERE id="+id+";");
					  
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public CountByAdminBeans getAllCountByAdmin() {
				Connection Conn=DbConnection.getInstance().getConnection();
				CountByAdminBeans admincount=new CountByAdminBeans();
				int i=0;
				 Statement st=null;
			        ResultSet rs=null;
				try 
				{
			     	 st=Conn.createStatement();
			      	 rs = st.executeQuery("SELECT id,\r\n" + 
			      	 		"(SELECT COUNT(*) FROM user)AS usercount,\r\n" + 
			      	 		"(SELECT COUNT(*) FROM user WHERE gender='male')AS maleusercount,\r\n" + 
			      	 		"(SELECT COUNT(*) FROM user WHERE gender='female')AS femaleusercount, "
			      	 	   +"(SELECT COUNT(DISTINCT userid) FROM user_rating_section1) AS entrires_judges FROM admin;");
			      	 while(rs.next())
			      	 {
			      		 
			      		 admincount.setId(rs.getInt("id"));
			      		 admincount.setUsercount(rs.getInt("usercount"));
			      		 admincount.setMaleusercount(rs.getInt("maleusercount"));
			      		 admincount.setFemaleusercount(rs.getInt("femaleusercount"));
			      		 admincount.setEntrires_judges(rs.getInt("entrires_judges"));
			      		 int entrires_pending=(rs.getInt("usercount"))-(rs.getInt("entrires_judges"));
			      		 admincount.setEntrires_pending(entrires_pending);
			      		 
			      	 }
			        }
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return admincount;
			}
			public CountUserDetailsBeans getAllCountByUserid(String id) {
				Connection Conn=DbConnection.getInstance().getConnection();
				CountUserDetailsBeans countUserDetailsBeans=new CountUserDetailsBeans();
				int i=0;
				 Statement st=null;
			        ResultSet rs=null;
				try 
				{
			     	 st=Conn.createStatement();
			      	 rs = st.executeQuery("SELECT id,\r\n" + 
			      	 		"(SELECT COUNT(*) FROM payment_details WHERE payment_details.userid=user.id) AS payment_count, \r\n" + 
			      	 		"(SELECT COUNT(*) FROM file_section2 WHERE file_section2.userid=user.id) AS file_count, "
			      	 		+"(SELECT COUNT(*) FROM file_section3 WHERE file_section3.userid=user.id) AS filecount3, "
			      	 		+"(SELECT COUNT(*) FROM file_section4 WHERE file_section4.userid=user.id) AS filecount4, "
			      	 		+"(SELECT COUNT(*) FROM user_doc WHERE user_doc.userid=user.id) AS userdoccount "
			      	 		+ "FROM user WHERE id="+id+";");
			      	 while(rs.next())
			      	 {
			      		 countUserDetailsBeans.setId(rs.getInt("id"));
			      		 countUserDetailsBeans.setPaymentcount(rs.getInt("payment_count"));
			      		 countUserDetailsBeans.setFilecount(rs.getInt("file_count"));
			      		 countUserDetailsBeans.setFilecount3(rs.getInt("filecount3"));
			      		 countUserDetailsBeans.setFilecount4(rs.getInt("filecount4"));
			      		countUserDetailsBeans.setUserdoccount(rs.getInt("userdoccount"));
			      	 }
			        }
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return countUserDetailsBeans;
			}
			public int checkUserRatingSection1(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
				 Statement st=null;
			        ResultSet rs=null;
				try 
				{
			     	 st=Conn.createStatement();
			      	 rs = st.executeQuery("SELECT * FROM user_rating_section1 WHERE userid="+beans.getUserid()+" AND judgeid="+beans.getJudgeid()+";");
			      	 while(rs.next())
			      	 {
			      		 i=rs.getInt("id");
			      		 
			      	 }
			        }
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int checkUserRatingSection4(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
				 Statement st=null;
			        ResultSet rs=null;
				try 
				{
			     	 st=Conn.createStatement();
			      	 rs = st.executeQuery("SELECT * FROM user_rating_section4 WHERE userid="+beans.getUserid()+" AND adminid="+beans.getAdminid()+";");
			      	 while(rs.next())
			      	 {
			      		 i=rs.getInt("id");
			      		 
			      	 }
			        }
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int checkUserRatingSection3(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
				 Statement st=null;
			        ResultSet rs=null;
				try 
				{
			     	 st=Conn.createStatement();
			      	 rs = st.executeQuery("SELECT * FROM user_rating_section3 WHERE userid="+beans.getUserid()+" AND judgeid="+beans.getJudgeid()+";");
			      	 while(rs.next())
			      	 {
			      		 i=rs.getInt("id");
			      		 
			      	 }
			        }
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int checkUserRatingSection2(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
				 Statement st=null;
			        ResultSet rs=null;
				try 
				{
			     	 st=Conn.createStatement();
			      	 rs = st.executeQuery("SELECT * FROM user_rating_section2 WHERE userid="+beans.getUserid()+" AND judgeid="+beans.getJudgeid()+";");
			      	 while(rs.next())
			      	 {
			      		 i=rs.getInt("id");
			      		 
			      	 }
			        }
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(st!=null) {
							st.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}try {
						if(rs!=null) {
							rs.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int UpdateRatingSection2(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("UPDATE user_rating_section2 SET rating=?,comment=? WHERE id=?;");
					  pst.setString(1, beans.getRating());
					  pst.setString(2, beans.getComment());
					  pst.setInt(3, beans.getId());
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int UpdateRatingSection4(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("UPDATE user_rating_section4 SET rating=?,comment=? WHERE id=?;");
					  pst.setString(1, beans.getRating());
					  pst.setString(2, beans.getComment());
					  pst.setInt(3, beans.getId());
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int UpdateRatingSection3(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("UPDATE user_rating_section3 SET rating=?,comment=? WHERE id=?;");
					  pst.setString(1, beans.getRating());
					  pst.setString(2, beans.getComment());
					  pst.setInt(3, beans.getId());
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int InsertRatingSection4(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into user_rating_section4 (rating,comment,userid,adminid) values(?,?,?,?);");
					 pst.setString(1, beans.getRating());
					  pst.setString(2, beans.getComment());
					  pst.setInt(3, beans.getUserid());
					  pst.setInt(4, beans.getAdminid());
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int InsertRatingSection3(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into user_rating_section3 (rating,comment,userid,judgeid) values(?,?,?,?);");
					 pst.setString(1, beans.getRating());
					  pst.setString(2, beans.getComment());
					  pst.setInt(3, beans.getUserid());
					  pst.setInt(4, beans.getJudgeid());
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int InsertRatingSection2(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into user_rating_section2 (rating,comment,userid,judgeid) values(?,?,?,?);");
					 pst.setString(1, beans.getRating());
					  pst.setString(2, beans.getComment());
					  pst.setInt(3, beans.getUserid());
					  pst.setInt(4, beans.getJudgeid());
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int UpdateRatingSection1(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("UPDATE user_rating_section1 SET rating=?,comment=? WHERE id=?;");
					  pst.setString(1, beans.getRating());
					  pst.setString(2, beans.getComment());
					  pst.setInt(3, beans.getId());
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int InsertRatingSection1(UserRatingBeans beans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into user_rating_section1 (rating,comment,userid,judgeid) values(?,?,?,?);");
					 pst.setString(1, beans.getRating());
					  pst.setString(2, beans.getComment());
					  pst.setInt(3, beans.getUserid());
					  pst.setInt(4, beans.getJudgeid());
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int insertPaymentDetalis(PaymentDetailsBeans paymentDetailsBeans) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into payment_details (userid,amount,stripeStatus,date,payment_by,transition_id,token,paymentid,currency,paymentMethod) values(?,?,?,?,?,?,?,?,?,?);");
					pst.setInt(1, paymentDetailsBeans.getUserid());
					pst.setString(2, paymentDetailsBeans.getAmount());
					pst.setString(3, paymentDetailsBeans.getStripeStatus());
					pst.setString(4, paymentDetailsBeans.getDate());
					pst.setString(5, paymentDetailsBeans.getPayment_by());
					pst.setString(6, paymentDetailsBeans.getTransition_id());
					pst.setString(7, paymentDetailsBeans.getToken());
					pst.setString(8, paymentDetailsBeans.getPaymentid());
					pst.setString(9, paymentDetailsBeans.getCurrency());
					pst.setString(10, paymentDetailsBeans.getPaymentMethod());
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int insertUserDoc(String file_path,String itemName,String userid) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into user_doc (userid,file_name,itemName) values(?,?,?);");
					pst.setString(1, userid);
					pst.setString(2, file_path);
					pst.setString(3, itemName);
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int insertUploadFamilyVideo(String file_path,String itemName,String userid) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into user_family_video (userid,file_name,itemName) values(?,?,?);");
					pst.setString(1, userid);
					pst.setString(2, file_path);
					pst.setString(3, itemName);
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int insertUploadOwnVideo(String file_path,String itemName,String userid) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into user_video (userid,file_name,itemName) values(?,?,?);");
					pst.setString(1, userid);
					pst.setString(2, file_path);
					pst.setString(3, itemName);
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int insertUploadFileSection4(String file_path,String itemName,String userid) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into file_section4 (userid,file_name,itemName) values(?,?,?);");
					pst.setString(1, userid);
					pst.setString(2, file_path);
					pst.setString(3, itemName);
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int insertUploadFileSection3(String file_path,String itemName,String userid) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into file_section3 (userid,file_name,itemName) values(?,?,?);");
					pst.setString(1, userid);
					pst.setString(2, file_path);
					pst.setString(3, itemName);
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int insertAdminVideo(String file_path,String itemName,String userid,String adminid) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into adminvideo (userid,file_name,itemName,adminid) values(?,?,?,?);");
					pst.setString(1, userid);
					pst.setString(2, file_path);
					pst.setString(3, itemName);
					pst.setString(4, adminid);
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
			public int insertUploadFileSection2(String file_path,String itemName,String userid) {
				Connection Conn=DbConnection.getInstance().getConnection();
				int i=0;
			    PreparedStatement pst=null;
				try 
				{
					pst=Conn.prepareStatement("insert into file_section2 (userid,file_name,itemName) values(?,?,?);");
					pst.setString(1, userid);
					pst.setString(2, file_path);
					pst.setString(3, itemName);
					  i=pst.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}finally {
					try {
						if(Conn!=null) {
							Conn.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					try {
						if(pst!=null) {
							pst.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return i;
			}
}
