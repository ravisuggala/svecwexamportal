<%@ page import = "dao.User,java.util.*" %>
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
String ay=miscUtil.noNull(request.getParameter("ay"));
ArrayList sems=new ArrayList(Arrays.asList(request.getParameterValues("sem")));


session.putValue("degree", degree);
session.putValue("ay", ay);

session.putValue("sems", sems);



%>

<jsp:include page='<%= header %>' flush="true" />


<script type="text/JavaScript">
<!--
document.writeln("<br><br><br><br><br><br><center><h3>JNTU Mapping Details are downloading....Please Wait..<br></br></h3></center>");
setTimeout("location.href = '././ActionServlet?option=downloadjntumappings';",150);
-->
</script>





		