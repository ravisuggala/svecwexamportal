<%@ page import = "dao.User" %>


<%
String header=new String();
User ur=(User)session.getAttribute("LoginRecord");
if(ur.getStatus().equals("admin"))
	header="./adminheader.jsp";
else if(ur.getStatus().equals("clerk"))
	header="./mainmenuheader.jsp";
else if(ur.getStatus().equals("ACE"))
	header="./aceheader.jsp";


	
%>

<jsp:include page='<%= header %>' flush="true" />
			
<br></br>
<center><h3>
<% 
String str;
if((str=(String)session.getAttribute("passres"))!=null)
	out.println(str);
	%>
	

</center>	
	
<br></br>
<br></br>
<br></br>


			
