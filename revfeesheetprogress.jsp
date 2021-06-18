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

FBSMiscUtilitiesBean utility=new FBSMiscUtilitiesBean();
String examname=request.getParameter("examname");
String type=request.getParameter("type");
String ldate1=utility.noNull(request.getParameter("ldate1"));
String sprev=utility.noNull(request.getParameter("sprev"));
session.setAttribute("examname", examname);
session.setAttribute("type", type);
session.setAttribute("ldate1", ldate1);
session.setAttribute("sprev", sprev);




%>

<jsp:include page='<%= header %>' flush="true" />


<script type="text/JavaScript">
<!--
document.writeln("<br><br><br><br><br><center><h3>Fee Portal Sheet is Downloading....Please Wait..<br></br></h3></center>");
setTimeout("location.href = '././ActionServlet?option=revfeesheet';",150);
-->
</script>





		