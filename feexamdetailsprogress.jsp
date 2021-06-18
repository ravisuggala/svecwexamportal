<%@ page import = "dao.User" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />


<%
String header=new String();
User ur=(User)session.getAttribute("LoginRecord");
if(ur.getStatus().equals("admin"))
	header="./adminheader.jsp";
else if(ur.getStatus().equals("clerk"))
	header="./mainmenuheader.jsp";
else if(ur.getStatus().equals("ACE"))
	header="./aceheader.jsp";


	

String yoa=miscUtil.noNull(request.getParameter("yoa"));




session.putValue("yoa", yoa);



%>

<jsp:include page='<%= header %>' flush="true" />


<script type="text/JavaScript">
<!--
document.writeln("<br><br><br><br><br><br><center><h3>Free Elective Exam details Sheet is Preparing....Please Wait..<br></br></h3></center>");
setTimeout("location.href = '././ActionServlet?option=feexamsheet';",150);
-->
</script>





		