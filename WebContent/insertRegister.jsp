<%@page import="com.dao.impl.ApiController"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java"   errorPage="" %>
<%@ page language ="java" import="java.sql.*" %>
<%@ page language="java" import="javax.servlet.*" %>
<%@ page language="java" import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%!    int count1 = 0, count2 = 0;
    int dom = 0;
    String str1 = "", str2 = "";
%>
<%
String username="";
String email="";
String  phoneno="";
String gender="";
String dob="";
String itemName="";
String filePath = "";
String cat="";
int imei = 0;
    String fieldName = "";
    String docTitle = "";
    String docType = "";
    String itemname="";
    String savedFile1="";
    int status=0;
    String url="";
    String image="";
    String[] multiIMEI = new String[5000];
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (!isMultipart) {
        System.out.println("Else is not executed");
    } else {
    	FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Iterator itr = items.iterator();
        String name = "";
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            System.out.println("here " + item);
            if (item.isFormField()) {
                fieldName = item.getFieldName();
               if(fieldName.equalsIgnoreCase("username")){
                	username = item.getString();
                }
                if(fieldName.equalsIgnoreCase("email")){
                	email = item.getString();
                }
                if(fieldName.equalsIgnoreCase("phoneno")){
                	phoneno = item.getString();
                }
               if(fieldName.equalsIgnoreCase("gender")){
                	gender = item.getString();
                }
                if(fieldName.equalsIgnoreCase("dob")){
                	dob = item.getString();
                }
                if(fieldName.equalsIgnoreCase("cat")){
                	cat = item.getString();
                }
                System.out.println("here fieldname" + fieldName);
                String value = item.getString();
                System.out.println("here fieldname" + value);
            } else {
                try {
     	 itemName = item.getName(); 
                    File savedFile = new File(getServletContext().getRealPath("/")+"UploadedFile/User/" + itemName );
                    filePath=(getServletContext().getRealPath("/")+"UploadedFile/User/" + itemName );
                    image="UploadedFile/User/" + itemName;
                    System.out.print("itemNameitemName"+itemName);
                    // File savedFile = new File("J:\\abc\\" + name);
                    item.write(savedFile);
                    System.out.print("nnnnnnnnnnnnnnn"+savedFile.getAbsolutePath());
                    savedFile1=savedFile.getAbsolutePath();
                    url=savedFile.getAbsolutePath();
					 StringTokenizer localStringTokenizer = new StringTokenizer(itemName, ".");
					if (localStringTokenizer.countTokens() >= 2) {
                        str1 = localStringTokenizer.nextToken();
                        str2 = localStringTokenizer.nextToken();
                    } else {
                    }
                   // response.sendRedirect("fileUploadSuccess.jsp");
                } catch (Exception e) {
                    System.out.println("here while uploadin" + e);
                }
            }
        }
    }
    try {
    	ApiController apiController=new ApiController();
    	String ticketid=apiController.generateNewToken();
    	String password=(username+dob.replace("-", "")).replace(" ", "");
    	String pageurl = request.getRequestURL().toString();
    	String baseURL = pageurl.substring(0, pageurl.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
    	String userurl=baseURL+"userLogin";
    	
    	int i=apiController.AddRegisterMember(username,email,phoneno,dob,gender,image,ticketid,itemName,cat,password);
		if(i>0){
		  System.out.println("Successfully Register");
		  apiController.sendMailWithFile(username,email,image,ticketid,filePath,itemName,password,userurl);
		  response.sendRedirect("thankupage.jsp?message=2");
		}
		else
		{
		System.out.println("Failed");
		response.sendRedirect("register.jsp?message=3");
		}
   } catch (Exception e) {
       e.printStackTrace();
   }%>
<%
%>