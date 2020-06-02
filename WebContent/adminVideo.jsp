<%@page import="com.dao.impl.AdminDaoImpl"%>
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
String userid="";
String adminid="";
String itemName="";
String filePath = "";
int imei = 0;
    String fieldName = "";
    String docTitle = "";
    String docType = "";
    String itemname="";
    String savedFile1="";
    int status=0;
    String url="";
    String file_path="";
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
               if(fieldName.equalsIgnoreCase("userid")){
            	   userid = item.getString();
                }
               if(fieldName.equalsIgnoreCase("adminid")){
            	   adminid = item.getString();
                }
               
                System.out.println("here fieldname" + fieldName);
                String value = item.getString();
                System.out.println("here fieldname" + value);
            } else {
                try {
     	 itemName = item.getName(); 
                    File savedFile = new File(getServletContext().getRealPath("/")+"UploadedFile/User/" + itemName );
                    filePath=(getServletContext().getRealPath("/")+"UploadedFile/User/" + itemName );
                    file_path="UploadedFile/User/" + itemName;
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
    	AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
    	
    	
    	int i=adminDaoImpl.insertAdminVideo(file_path,itemName,userid,adminid);
		response.sendRedirect("viewUserUserVideo?clr=app_section4&act=app_section4&id="+userid);
		
   } catch (Exception e) {
       e.printStackTrace();
   }%>
<%
%>