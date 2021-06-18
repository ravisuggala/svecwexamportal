
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
String elecat="";
String disp="";
ArrayList students=new ArrayList();
ArrayList subjectsList=new ArrayList();
String target=miscUtil.noNull(request.getParameter("hiddenActionType"));
String fe="";
if(target.equals("storemarks"))
{
	degree=session.getValue("degree").toString();
	branch=session.getValue("branch").toString();
	sem=session.getValue("sem").toString();
	section=session.getValue("section").toString();
	reg=session.getValue("reg").toString();
	ay=session.getValue("ay").toString();
	
	cat=miscUtil.noNull(request.getParameter("cat"));
	session.putValue("cat",cat);
	elecat=miscUtil.noNull(request.getParameter("elecat"));
	session.putValue("elecat",elecat);
	students=(ArrayList)session.getValue("students");	
	subjectsList=(ArrayList)session.getValue("subjectslist");
	
	String subject= miscUtil.noNull(request.getParameter("subject"));
	session.putValue("subject",subject);
	
	if(cat.equals("fe"))
		 fe=miscUtil.noNull(session.getValue("fe"));
}
else
{
	degree=miscUtil.noNull(request.getParameter("degree"));
	 branch=miscUtil.noNull(request.getParameter("branch"));
	 sem=miscUtil.noNull(request.getParameter("sem"));
	 reg=miscUtil.noNull(request.getParameter("reg"));
	 ay=miscUtil.noNull(request.getParameter("ay"));
	 cat=miscUtil.noNull(request.getParameter("cat"));
//	 type=miscUtil.noNull(request.getParameter("type"));
	 section=miscUtil.noNull(request.getParameter("section"));
    students=stdb.getStudentList(degree, branch, sem,section); 
	String subject= miscUtil.noNull(request.getParameter("subject"));
	elecat=miscUtil.noNull(request.getParameter("elecat"));

	 if(cat.equals("fe"))
		 fe=miscUtil.noNull(request.getParameter("fe"));

	session.putValue("degree",degree);
	session.putValue("branch",branch);
	session.putValue("sem",sem);
	session.putValue("section",section);
	session.putValue("reg",reg);
	session.putValue("ay",ay);
	session.putValue("cat",cat);
	session.putValue("fe",fe);
	//session.putValue("type",type);
	session.putValue("elecat",elecat);
	session.putValue("subject",subject);
	
	session.putValue("students", students);
}
	boolean validsec=new StudentDB().isValidSection(degree,branch,sem,section);

	if(!validsec)
	{
		session.setAttribute("error", "No students for selected branch and section");
		response.sendRedirect("./errors.jsp");
	}
	else
	{
		if(reg.equals("R20"))
		{
			session.putValue("option", "castep2");
			response.sendRedirect("./ActionServlet");
			
		}
		else
		{
			session.setAttribute("error", "No seperate Assignment marks for selected regulation");
			response.sendRedirect("./errors.jsp");		
		}
	
	}
	
			



	
%>

	</body>
</html>
