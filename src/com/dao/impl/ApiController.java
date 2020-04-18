package com.dao.impl;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.json.JSONArray;
import org.json.JSONObject;

import com.beans.Userbeans;

import common.database.DbConnection;

public class ApiController {
	public static void main(String[] args) {
		System.out.println("rrrrrrrrrrrrrrrr");
	}
	public String generateNewToken() {
		SecureRandom secureRandom = new SecureRandom(); //threadsafe
		Base64.Encoder base64Encoder = Base64.getUrlEncoder(); //threadsafe
	    byte[] randomBytes = new byte[24];
	    secureRandom.nextBytes(randomBytes);
	    return base64Encoder.encodeToString(randomBytes);
	}
	public int AddRegisterMember(String username,String email,String phoneno,String dob,String gender,String file,String ticketid,String itemName) {
		// TODO Auto-generated method stub

		 Connection Conn=DbConnection.getInstance().getConnection();
		   int i=0;
		    PreparedStatement pst=null;
		   
		try 
		{
			pst=Conn.prepareStatement("insert into user (username,ticketid,email,phoneno,dob,gender,file,filename) values(?,?,?,?,?,?,?,?)");
			 pst.setString(1,username);
			  pst.setString(2, ticketid);
			  pst.setString(3, email);
			  pst.setString(4, phoneno);
			  pst.setString(5, dob);
			  pst.setString(6, gender);
			  pst.setString(7, file);
			  pst.setString(8, itemName);
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
	public void sendMailWithFile(String username,String email, String file,String ticketid,String filePath,String itemName) {
		Thread thread=new Thread() {
			public void run() {
				String subject="Create User";
				String txt_msg="User name : "+username+"\n"+"ticketid : "+ticketid+"";
				String host ="smtp.gmail.com" ; 
				String user = "info@parrotinfosoft.com";
				String pass = "info@123"; 
				String to = email; 
				String from = "info@parrotinfosoft.com";				
				Properties props = new Properties();
		        //props.put("mail.smtp.host", "smtp.mail.yahoo.com");
		        props.put("mail.smtp.host", "smtp.gmail.com");  
		        props.put("mail.smtp.socketFactory.port", "465");
		        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.port", "465");

		        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
		                return new javax.mail.PasswordAuthentication(user, pass);//change accordingly  
		            }
		        });
		        //compose message  
		        try {
		            MimeMessage message = new MimeMessage(session);
		            message.setFrom(new InternetAddress(from));//change accordingly  
		            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		            message.setSubject(subject);
		            message.setText(txt_msg);
		            BodyPart messageBodyPart = new MimeBodyPart();
		            messageBodyPart.setText(txt_msg);
		            // Create a multipar message
		            Multipart multipart = new MimeMultipart();

		            // Set text message part
		            multipart.addBodyPart(messageBodyPart);

		            // Part two is attachment
		            messageBodyPart = new MimeBodyPart();
		            String filename = filePath;
		            System.out.println("filenamefilenamefilenamefilename=nn="+filename);
		            DataSource source = new FileDataSource(filename);
		            messageBodyPart.setDataHandler(new DataHandler(source));
		            messageBodyPart.setFileName(itemName);
		            multipart.addBodyPart(messageBodyPart);

		            // Send the complete message parts
		            message.setContent(multipart);
		            //send message  
		            Transport.send(message);
		            System.out.println("message sent to ----" + to);

		        } catch (MessagingException e) {
		            throw new RuntimeException(e);

		        }

				
				

			}
		};
		thread.start();
	}
	public ArrayList<Userbeans> getUserList( ) {
		
		ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
        boolean check = false;
        Connection conn=DbConnection.getInstance().getConnection();
         Statement st=null;
        ResultSet rs=null;
        try
        {
        	
     	  st=conn.createStatement();
     	  
      	 rs = st.executeQuery("select * from user;");
      	System.out.println("select * from user;");
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
				// TODO: handle exception
			}
			try {
				if(st!=null) {
					st.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
			try {
				if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return userbeanss;
		
		
		
	}
}
