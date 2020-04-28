<%
			int last_index=1;
			String last_index1=request.getParameter("last_index");
			if(last_index1!=null){
    			last_index = Integer.parseInt(last_index1);
        		}
			System.out.println("last_index1=>>"+last_index1);
			int newPage=0;
			String order1=request.getParameter("order");
    		String spageid=request.getParameter("page");
    		String newPage1=request.getParameter("page");
    		if(newPage1!=null){
    		newPage = Integer.parseInt(newPage1);
    		}else{
    			newPage=1;
    		}
        %>
			<select class="form-control" name="order" id="order" onChange="window.location.href=this.value">
			<%if(order1!=null){ 
				order2=Integer.parseInt(order1);
				int initial_value=0;
				for(int i=1;i<=5;i++){
					initial_value=initial_value+10;
					if(order2==initial_value){
			%>
			<option value="<%=redirect_url %>&order=<%=initial_value %>&searchValue=<%=searchValue %>" selected="selected"><%=initial_value %></option>
			<%}else{ %>
			<option value="<%=redirect_url %>&order=<%=initial_value %>&searchValue=<%=searchValue %>"><%=initial_value %></option>
			<%}}}else{
				order2=10;
				int initial_value=0;
				for(int i=1;i<=5;i++){
					initial_value=initial_value+10;
			%>
  <option value="<%=redirect_url %>&order=<%=initial_value %>&searchValue=<%=searchValue %>"><%=initial_value %></option>
  <%} }
  %>
				</select>
			<%
			if(spageid==null){
				next=10;
				page1=1;
				pading_count=page1;
				pre=1;
    			page1 = page1-1;
    			count=1;
    		}else{
    			page1=Integer.parseInt(spageid);
    			next=page1;
    			pre=page1;
    			pading_count=page1;
				count=(order2*(page1-1))+1;
    			page1 = page1-1;
    			page1 = page1*order2+1;
    			page1 = page1-1;
    		}
			%>