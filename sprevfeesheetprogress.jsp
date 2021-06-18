<%@ page import = "dao.User,dao.FBSMiscUtilitiesBean,java.util.ArrayList" %>


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

ArrayList exams=new ArrayList();

String stlist[]=request.getParameterValues("ToLB");
for(int i=0;i<stlist.length;i++)
{
	exams.add(stlist[i]);
}

session.putValue("exams", exams);

%>

<jsp:include page='<%= header %>' flush="true" />


<script type="text/JavaScript">
<!--
document.writeln("<br><br><br><br><br><center><h3>Fee Portal Sheet is Downloading....Please Wait..<br></br></h3></center>");
setTimeout("location.href = '././ActionServlet?option=sprevfeesheet';",150);
-->
</script>





		