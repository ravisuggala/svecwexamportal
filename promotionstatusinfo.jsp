<%@ page import = "dao.User,dao.FBSMiscUtilitiesBean" %>



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
<br></br>
<center><h3>
 ${status}
</h3>
</center>	
	
<br></br>




