
<%@ page import="java.util.*,dao.*"%>
<jsp:useBean id="miscUtil" scope="session"
	class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id="fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id="subdb" scope="session" class="dao.SubjectDB" />
<jsp:useBean id="stdb" scope="session" class="dao.StudentDB" />

<%@ page import="dao.User"%>
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
String yoa="";
String disp="";
ArrayList students=new ArrayList();

	degree=miscUtil.noNull(request.getParameter("degree"));
	 branch=miscUtil.noNull(request.getParameter("branch"));
	 sem=miscUtil.noNull(request.getParameter("sem"));
	 reg=miscUtil.noNull(request.getParameter("reg"));
	 ay=miscUtil.noNull(request.getParameter("ay"));
	 section=miscUtil.noNull(request.getParameter("section"));
	 yoa=miscUtil.noNull(request.getParameter("yoa"));

    students=stdb.getStudentList(degree, branch, sem,section,yoa); 
	
	
	
	session.putValue("degree",degree);
	session.putValue("branch",branch);
	session.putValue("sem",sem);
	session.putValue("section",section);
	session.putValue("reg",reg);
	session.putValue("ay",ay);
	session.putValue("yoa",yoa);
	
	session.putValue("students", students);

	boolean validsec=new StudentDB().isValidSection(degree,branch,sem,section);

	if(!validsec)
	{
		session.setAttribute("error", "No students for selected branch and section");
		response.sendRedirect("./errors.jsp");
	}
	else
	{
		String sm=subdb.isContainsMiniProject(degree,branch,sem,reg);
		if(!sm.equals(""))
    	{
    		session.putValue("subject", sm);
    		session.putValue("type", "S");
    		ArrayList mapids=subdb.getMapIDs(students,sm);
    		session.putValue("mapids", mapids);
    		response.sendRedirect("./miniprojectmarks.jsp");
    	}
    	else
    	{
    		String error="No Mini Project for selected branch and semester";
    		session.putValue("error", error);
    		response.sendRedirect("./errors.jsp");
    	}
   	
	}
		



	
%>

</body>
</html>
