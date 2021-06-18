
<%@ page import="java.util.*,dao.*"%>
<jsp:useBean id="miscUtil" scope="session"
	class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id="fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id="subdb" scope="session" class="dao.SubjectDB" />
<jsp:useBean id="exdb" scope="session" class="dao.ExternalExamDB" />

<%


String examcode=miscUtil.noNull(request.getParameter("exam"));


session.setAttribute("examname", examcode);


ExternalExamDB eedb=new ExternalExamDB();
ExternalExam ee=eedb.getExamInfo(examcode);
int cnt=eedb.deleteExamRegistrations(examcode);
%>

<%@ page import="dao.User"%>


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

<html>
<head>
<title>SVECW--Examination Portal - External Examinations</title>

</head>
<body>
	<div id="centre">
		<br><br>
		<CENTER>
		<h3><%=cnt %> Examination Registrations are successfully deleted</h3>
			</CENTER>
			<br><br>
</body>
</html>
