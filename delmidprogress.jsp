<%@ page import = "dao.User" %>
<%@ page import = "java.util.*,dao.*" %>
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


String degree=miscUtil.noNull(request.getParameter("degree"));
String sem=miscUtil.noNull(request.getParameter("sem"));
String ay=miscUtil.noNull(request.getParameter("ay"));
String type[]=request.getParameterValues("type");

ArrayList types=new ArrayList(Arrays.asList(type));

session.putValue("degree", degree);
session.putValue("sem", sem);
session.putValue("ay", ay);
session.putValue("types", types);
%>

<jsp:include page='<%= header %>' flush="true" />


<script type="text/JavaScript">
<!--
document.writeln("<br><br><br><br><br><br><br><br><br><br><center><h3> Mid Marks are Deleting....Please Wait..<br></br></h3></center>");
setTimeout("location.href = '././ActionServlet?option=delmidprogress';",150);
-->
</script>





		