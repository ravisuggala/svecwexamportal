
<%@ page import = "java.util.*,dao.*" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "subdb1" scope="session" class="dao.MapSubjectDB" />
<jsp:useBean id = "subdb" scope="session" class="dao.SubjectDB" />

<%
String branch=new String();
String sem=new String();
String ay=new String();
String degree=new String();
String type=new String();
String section=new String();
String totst;
String cat=new String();
String fe="";
String reg="";
	//System.out.println("in else");

 degree=miscUtil.noNull(request.getParameter("degree"));
 branch=miscUtil.noNull(request.getParameter("branch"));
 sem=miscUtil.noNull(request.getParameter("sem"));
 ay=miscUtil.noNull(request.getParameter("ay"));
 type=miscUtil.noNull(request.getParameter("midno"));
 section=miscUtil.noNull(request.getParameter("section"));
 cat=miscUtil.noNull(request.getParameter("cat"));
 reg=miscUtil.noNull(request.getParameter("reg"));
 boolean validsec=false;
	 validsec=new StudentDB().isValidSection(degree,branch,sem,section);

 if(!validsec)
 {
 	session.setAttribute("error", "No students for selected branch and section");
 	response.sendRedirect("./errors.jsp");
 }
 

 
 
 
  
session.putValue("degree",degree);
session.putValue("branch",branch);
session.putValue("sem",sem);
session.putValue("ay",ay);
session.putValue("section",section);
session.putValue("midno",type);
session.putValue("reg",reg);

if(cat.equals("elective"))
{
	
	HashMap subjectsList = subdb.getElectiveList(degree,branch,sem,reg);
	session.putValue("electives", subjectsList);
	response.sendRedirect("./electivetypes1.jsp");
}

else if(cat.equals("fe"))
{
//select * from mids where midno='I' and mapid in 
//(SELECT mapid FROM examcell.freeelectives where branch='C.S.E' and sem='III-I' and ay='2016-2017'  and section='B')
	MidExamDB middb=new MidExamDB();
	ArrayList femidmarks=new ArrayList();
	if(type.equals("gt"))
		femidmarks=middb.getFEGTMarks(ay,sem,degree,reg);
	else if(type.equals("final"))
		femidmarks=middb.getFinalFEMarks(branch,sem,ay,section);
	else if(type.equals("assignment"))
		femidmarks=middb.getAssignmentFEMarks(branch,sem,ay,section);
	else
		femidmarks=middb.getFEMarks(type,branch,sem,ay,section);
	
	session.putValue("marksdata", femidmarks);
	
	if(!type.equals("gt"))
		response.sendRedirect("./femidmarksshow.jsp");
	else
		response.sendRedirect("./fegtmarksshow.jsp");
  
}
else if(cat.equals("all"))
{
	response.sendRedirect("./allfinalmarks.jsp");
}
ArrayList subjects=subdb1.getSubjectsListForMid(branch, sem,ay,section);
session.putValue("subjects", subjects);

String disp="List of Subjects for "+sem+" "+branch;
%>

<%@ page import = "dao.User" %>


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
		<title>SVECW--Examination Portal - Mid Examinations</title>
		
	</head>
	<body>
		  <div id="centre">
			    <center><h3>Mid Examinations Report</h3></center>
			    <CENTER>
			    <FORM NAME = REGISTER METHOD = POST ACTION = "./displaymidmarks.jsp">
							
							
						<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="500">
							<TR>
							    <TD COLSPAN="2" ALIGN="center"><h2><b> <%=disp%></b></h2></TD>
							</TR>
							
								
							<TR>
								
								<TD  colspan=2 WIDTH="50%" align="left">
								<table border=0>
								<tr>
								<td>List of the Subjects:
								<td>
								<select name=subject>
								<option value=""></option>
								
									<%
										for(int i=0;i<subjects.size();i++)
										{
											Subject sub=(Subject)subjects.get(i);
											
											%>
											<option value='<%=sub.getCode() %>'><%=sub.getSname() %></option>
											<%
											
										}
									%>
									</select>
									</tr>
									</table>
								</TD>
							</TR>
														
							<TR>
								<TD colspan=2 rowspan=2 align="center"><INPUT TYPE="SUBMIT" NAME="Next" VALUE="..Next-->"></INPUT></TD>

							</TR>
							</FORM>
						</TABLE>
					    </CENTER>			  
					   
					   
					   
		  </div>
		<div id="pied"></div>
	</div>
	<br></br>
	<br></br>
	<br></br>
	
	</body>
</html>
