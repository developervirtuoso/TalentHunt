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
import com.beans.Admin;
import com.beans.Userbeans;
import common.database.DbConnection;
public class AdminDaoImpl {
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
}
