<%
  
  System.out.println("page_count=>>"+page_count);
 
  System.out.println("pading_count=>>"+pading_count);
  System.out.println("order2=>>"+order2);
  System.out.println("last_index=>>"+last_index);
  
  int i=1;
  int loop_end=last_index+9;
  System.out.println("loop_end11=>>"+loop_end);
  
  if(loop_end>page_count){
	  loop_end=page_count;
	  System.out.println("loop_end22=>>"+loop_end);
  }
  %>
			
			<%
			
			 if(total_rows<=order2){
			}else{
                    	%>
                    	
			<section class="pagi"><ul class="pagination">
			
			
			 <%if(last_index>10){%>
			 
			  <li class="page-item"><a class="page-link" href="<%=redirect_url %>&last_index=1&page=1&order=<%=order2 %>&searchValue=<%=searchValue %>">First</a></li>
			  
			 <%} if(pre==1){ 
			 %> 
   <%}else{ 
	   pre=pre-1;
	   
	   if(pading_count==last_index){
   %>
  <li class="page-item"><a class="page-link" href="<%=redirect_url %>&last_index=<%=pading_count-10%>&page=<%=pre%>&order=<%=order2 %>&searchValue=<%=searchValue %>">Previous</a></li>
  <% }else{ %>
    <li class="page-item"><a class="page-link" href="<%=redirect_url %>&last_index=<%=last_index%>&page=<%=pre%>&order=<%=order2 %>&searchValue=<%=searchValue %>">Previous</a></li>
    <% } } %> 
  
  
  <%if(last_index>10){
	  /* if(pading_count==last_index){  */
	  %>
  <%-- <li class="page-item" ><a class="page-link" href="addAmountHistory.jsp?clr=languagesList&act=languagesList1&last_index=<%=last_index-10%>&page=<%=pading_count-10%>&order=<%=order2 %>&searchValue=<%=searchValue %>">...</a></li> --%>
   <%-- <% }else{ %> --%>
   <li class="page-item" ><a class="page-link" href="<%=redirect_url %>&last_index=<%=last_index-10%>&page=<%=last_index-10%>&order=<%=order2 %>&searchValue=<%=searchValue %>">...</a></li>
  <%  } %>
  
  <%
  for(i=last_index;i<=loop_end;i++){
	  
	  System.out.println("i=>>"+i);
	  
	  if(pading_count==i){
		  
	  %>
  <li class="page-item" ><a class="page-link" href="<%=redirect_url %>&last_index=<%=last_index%>&page=<%=i%>&order=<%=order2 %>&searchValue=<%=searchValue %>" style="color:#fff;background-color:rgb(0, 160, 223);"><%=i%></a></li>
  <%}else{
	  %>
<li class="page-item" ><a class="page-link" href="<%=redirect_url %>&last_index=<%=last_index%>&page=<%=i%>&order=<%=order2 %>&searchValue=<%=searchValue %>"><%=i%></a></li>
<% } %>
<%
 } 
%>

<%if(loop_end<page_count){ %>
 <li class="page-item" ><a class="page-link" href="<%=redirect_url %>&last_index=<%=i%>&page=<%=i%>&order=<%=order2 %>&searchValue=<%=searchValue %>">...</a></li> 
<%} %>



<%if(page_count==newPage){ 
%>
  <%}else{ 
	  next=next+1;
	  newPage=newPage+1;
	  
	  if(pading_count==loop_end){
   %>
    <li class="page-item"><a class="page-link" href="<%=redirect_url %>&last_index=<%=i%>&page=<%=newPage%>&order=<%=order2 %>&searchValue=<%=searchValue %>">Next</a></li>
    <% }else{ %>
    <li class="page-item"><a class="page-link" href="<%=redirect_url %>&last_index=<%=last_index%>&page=<%=newPage%>&order=<%=order2 %>&searchValue=<%=searchValue %>">Next</a></li>
    <% } } %> 
    
    
    <%if(loop_end<page_count){ 
    	
    	int last_index3 = page_count%10;
    	last_index3 = last_index3-1;
    	last_index3 = page_count-last_index3;
    	System.out.println("last_index3=>>"+last_index3);
    %>
 <li class="page-item" ><a class="page-link" href="<%=redirect_url %>&last_index=<%=last_index3%>&page=<%=page_count%>&order=<%=order2 %>&searchValue=<%=searchValue %>">Last</a></li> 
<%} %>
    
  
</ul></section>
																																																	
<%
}
			%> 