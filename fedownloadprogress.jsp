<%@ page import = "dao.User" %>


<%

String examname=request.getParameter("examname");
session.putValue("examname", examname);

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


<script type="text/JavaScript">
<!--
document.writeln("<br><br><br><br><br><center><h3>Free Elective Registrations are Downloading....Please Wait..<br></br></h3></center>");
setTimeout("location.href = '././ActionServlet?option=downloadferegistrationprogress';",150);
-->
</script>





		