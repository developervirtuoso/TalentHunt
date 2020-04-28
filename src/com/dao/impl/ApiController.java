package com.dao.impl;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
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
import com.beans.ConnFile;
import com.beans.Userbeans;
import common.database.DbConnection;
public class ApiController {
	private static SecretKeySpec secretKey;
	private static byte[] key;
	public static void main(String[] args) {
		System.out.println("rrrrrrrrrrrrrrrr");
		ApiController apiController=new ApiController();
		String originalString = "123456";
        String encryptedString = apiController.encrypt(originalString) ;
        String decryptedString = apiController.decrypt(encryptedString) ;
        System.out.println(originalString);
        System.out.println(encryptedString);
        System.out.println(decryptedString);
	}
    public static void setKey(String myKey) 
    {
        MessageDigest sha = null;
        try {
            key = myKey.getBytes("UTF-8");
            sha = MessageDigest.getInstance("SHA-1");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16); 
            secretKey = new SecretKeySpec(key, "AES");
        } 
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } 
        catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
    public String encrypt(String strToEncrypt) 
    {
        try
        {
            setKey(ConnFile.secretKey);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
        } 
        catch (Exception e) 
        {
            System.out.println("Error while encrypting: " + e.toString());
        }
        return null;
    }
    public String decrypt(String strToDecrypt) 
    {
        try
        {
            setKey(ConnFile.secretKey);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
        } 
        catch (Exception e) 
        {
            System.out.println("Error while decrypting: " + e.toString());
        }
        return null;
    }
	public String generateNewToken() {
		SecureRandom secureRandom = new SecureRandom(); //threadsafe
		Base64.Encoder base64Encoder = Base64.getUrlEncoder(); //threadsafe
	    byte[] randomBytes = new byte[24];
	    secureRandom.nextBytes(randomBytes);
	    return base64Encoder.encodeToString(randomBytes);
	}
	public String getAuthKey() {
		SecureRandom secureRandom = new SecureRandom(); //threadsafe
		Base64.Encoder base64Encoder = Base64.getUrlEncoder(); //threadsafe
	    byte[] randomBytes = new byte[40];
	    secureRandom.nextBytes(randomBytes);
	    return base64Encoder.encodeToString(randomBytes);
	}
	public int AddRegisterMember(String username,String email,String phoneno,String dob,String gender,String file,String ticketid,String itemName,String cat) {
		 Connection Conn=DbConnection.getInstance().getConnection();
		   int i=0;
		    PreparedStatement pst=null;
		try 
		{
			pst=Conn.prepareStatement("insert into user (username,ticketid,email,phoneno,dob,gender,file,filename,cat) values(?,?,?,?,?,?,?,?,?)");
			 pst.setString(1,username);
			  pst.setString(2, ticketid);
			  pst.setString(3, email);
			  pst.setString(4, phoneno);
			  pst.setString(5, dob);
			  pst.setString(6, gender);
			  pst.setString(7, file);
			  pst.setString(8, itemName);
			  pst.setString(9, cat);
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
		            char ch='"';
		            messageBodyPart.setText(txt_msg);
		            messageBodyPart.setContent("<html>\n" + 
		            		"<head>\n" + 
		            		"<title>Astrological.ly</title>\n" + 
		            		"<style type='text/css'> 	body {      } *[role='form'] {      } *[role='form'] h2 {     } </style>\n" + 
		            		"</head>\n" + 
		            		 "<body style='background: url("+ch+"http://142.93.223.67:8080/TalentHunt/img/bg.jpg"+ch+") fixed; background-size: cover;'>\n" + 
		            		 "<div style=' padding: 100px;'>\n" + 
		            		 "          <form class='form-horizontal' role='form' style='max-width: 530px;     padding: 15px;     margin: 10% auto 0;     border-radius: 0.3em;     background-color: #fff;'>\n" + 
		            		 "            <h2 style='font-family: "+ch+"Open Sans"+ch+" , sans-serif;     font-size: 40px;     font-weight: 600;     color: #000000;     margin-top: 5%;     text-align: center;     text-transform: uppercase;     letter-spacing: 4px; '>Thanks For your concern </h2>\n" + 
		            		 "<p class='text-center'>In case of any queries please get in touch with us via info@musicworld.com </p>\n" + 
		            		 "		  </form>\n" + 
		            		 "        </div> <!-- ./container -->\n" + 
		            		 "</body>"+
		            		"</html>\n" + 
		            		""
		            		+ "","text/html" );  
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
	public void getEmployeeProfile(JSONObject jsonObject,String authkey) {
	    boolean check = false;
	    Connection conn=DbConnection.getInstance().getConnection();
	     Statement st=null;
	    ResultSet rs=null;
	    try
	    {
	 	  st=conn.createStatement();
	  	rs = st.executeQuery("Select * from admin where admin.authkey="+authkey+";");
	  	System.out.println("Select * from admin where admin.authkey="+authkey+";");
	  	 while(rs.next())
	  	 {
	  		jsonObject.put("id", rs.getString("id")+"");
	  		jsonObject.put("name", rs.getString("name")+"");
	  		jsonObject.put("email", rs.getString("email")+"");
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
}
