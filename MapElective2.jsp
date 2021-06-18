
<%@ page import = "java.util.*,dao.*" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "subdb" scope="session" class="dao.SubjectDB" />
<jsp:useBean id = "stdb" scope="session" class="dao.StudentDB" />

<%
String branch=new String();

String sem=new String();

String ay=new String();
String reg=new String();
String degree=new String();
String section=new String();

String subject="";
String elecat="";
String yoa="";
	//System.out.println("in else");
	 degree=miscUtil.noNull(request.getParameter("degree"));
	 branch=miscUtil.noNull(request.getParameter("branch"));
  	 sem=miscUtil.noNull(request.getParameter("sem"));
     section=miscUtil.noNull(request.getParameter("section"));
     reg=miscUtil.noNull(request.getParameter("reg"));
     ay=miscUtil.noNull(request.getParameter("ay"));
     subject=miscUtil.noNull(request.getParameter("subject"));
     elecat=miscUtil.noNull(request.getParameter("elecat"));
     yoa=miscUtil.noNull(request.getParameter("yoa"));
 	boolean validsec=new StudentDB().isValidSection(degree,branch,sem,section,yoa);

 if(!validsec)
 {
 	session.setAttribute("error", "No students for selected branch and section");
 	response.sendRedirect("./errors.jsp");
 }

 
session.putValue("degree",degree);
session.putValue("branch",branch);
session.putValue("sem",sem);
session.putValue("section",section);
session.putValue("reg",reg);
session.putValue("ay",ay);
session.putValue("selele",elecat);
session.putValue("subject",subject);
session.putValue("yoa",yoa);
response.sendRedirect("./MapElective3.jsp");

%>


</html>
