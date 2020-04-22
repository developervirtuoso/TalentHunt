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
import org.json.JSONObject;
import com.beans.Admin;
import common.database.DbConnection;

public class AdminDaoImpl {
	public Boolean checkAdmin(Admin admin){ 
//		TrippleDes td= new TrippleDes();
		
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
	         	String query = "select count(*) from superadmin where email='"+email+"' and password='"+password+"'";
	         	System.out.println("query="+query);
	         	rs = stmt.executeQuery(query);
	         	 while (rs.next()) {
	         		 count=rs.getInt(1);
	         	 }
	         		 if(count!=0){
	         			stmt1=conn.createStatement();
	         			String query1 = "select * from superadmin where email='"+email+"' and password='"+password+"'";
	         			rs1 = stmt1.executeQuery(query1);
	                	 while (rs1.next()) {
	                		 
	                		 id=rs1.getInt("id");
	                		 email=rs1.getString("email");
	                		 password=rs1.getString("password");
	                		 admin.setId(id);
	                		 admin.setEmail(email);
	                		 admin.setPassword(password);
	                		 admin.setAuthkey(rs1.getString("authkey"));
	         		 
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
}
