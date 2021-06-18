
<%@ page import = "java.util.*,dao.*" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "subdb" scope="session" class="dao.SubjectDB" />
<jsp:useBean id = "stdb" scope="session" class="dao.StudentDB" />

<%@ page import = "dao.User" %>
<%
String header=new String();
User ur=(User)session.getAttribute("LoginRecord");
if(ur.getStatus().equals("admin"))
	header="./adminheader.jsp";
else if(ur.getStatus().equals("clerk"))
	header="./mainmenuheader.jsp";
%>


<%
String branch=new String();

String sem=new String();

String ay=new String();
String reg=new String();
String degree=new String();
String cat=new String();
String type=new String();
String section=new String();

String disp="";
ArrayList students=new ArrayList();

	degree=miscUtil.noNull(request.getParameter("degree"));
	 branch=miscUtil.noNull(request.getParameter("branch"));
	 sem=miscUtil.noNull(request.getParameter("sem"));
	 reg=miscUtil.noNull(request.getParameter("reg"));
	 ay=miscUtil.noNull(request.getParameter("ay"));
	 cat=miscUtil.noNull(request.getParameter("cat"));
	 type=miscUtil.noNull(request.getParameter("type"));
	 section=miscUtil.noNull(request.getParameter("section"));

    students=stdb.getStudentList(degree, branch, sem,section); 
	String subject= miscUtil.noNull(request.getParameter("subject"));
	
	
	session.putValue("degree",degree);
	session.putValue("branch",branch);
	session.putValue("sem",sem);
	session.putValue("section",section);
	session.putValue("reg",reg);
	session.putValue("ay",ay);
	session.putValue("cat",cat);
	
	session.putValue("type",type);
	
	session.putValue("subject",subject);
	
	session.putValue("students", students);

	boolean validsec=new StudentDB().isValidSection(degree,branch,sem,section);

	if(!validsec)
	{
		session.setAttribute("error", "No students for selected branch and section");
		response.sendRedirect("./errors.jsp");
	}
	else
	{
   
	String utype=ur.getStatus();
	boolean freez=false;
	if(!utype.equals("admin"))
		 freez=new MidExamDB().isMidFreeze(sem,degree,ay,type);
	
	if(freez)
	{
		 ServletContext sc = getServletContext();
		    RequestDispatcher rd = sc.getRequestDispatcher("/statusinfo.jsp");
		    request.setAttribute("status", "Mid Marks are freezed for the selected branch and section");
			rd.forward(request, response);
	}

	else
	{
	session.putValue("option", "labstep2");
	response.sendRedirect("./ActionServlet");
	}
	}
		



	
%>

	</body>
</html>
