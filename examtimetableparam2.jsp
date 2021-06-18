
<%@ page import = "java.util.*,dao.*" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "subdb" scope="session" class="dao.SubjectDB" />
<jsp:useBean id = "exdb" scope="session" class="dao.ExternalExamDB" />

<%

String sem=new String();
String ay=new String();
String degree=new String();
String branch=new String();
String reg=new String();
ArrayList examsList=new ArrayList();
String target=miscUtil.noNull(session.getValue("target"));
if(target.equals("status"))
{
	degree=session.getValue("degree").toString();
	
	sem=session.getValue("sem").toString();
	
	ay=session.getValue("ay").toString();
	reg=session.getValue("reg").toString();
	examsList=(ArrayList)session.getValue("examslist");
}
else
{
	degree=miscUtil.noNull(request.getParameter("degree"));
	 
	 sem=miscUtil.noNull(request.getParameter("sem"));
	 
	 ay=miscUtil.noNull(request.getParameter("ay"));
	 reg=miscUtil.noNull(request.getParameter("reg"));
	
	 examsList=exdb.getExamsList1(degree, sem,ay,reg); 
	 
	session.putValue("degree",degree);
	
	session.putValue("sem",sem);
	session.putValue("ay",ay);
	session.putValue("reg",reg);
	session.putValue("examslist", examsList);

		
}
	//System.out.println("in else");
	
String disp="List of Examinations for "+sem+" "+degree;
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
		<title>SVECW--Examination Portal - External Examinations</title>
		
	</head>
	<body>
		  <div id="centre">
			    <center><h2>External Examinations Time Table Setting</h2></center>
			    <CENTER>
			    <FORM NAME = REGISTER METHOD = POST ACTION = "./showexamsubjects.jsp">
							<INPUT TYPE=HIDDEN NAME="hiddenActionType" VALUE = "xternalstep2">
							
						<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="500">
							<TR>
							    <TD COLSPAN="2" ALIGN="center"><h2><b> <%=disp%></b></h2></TD>
							</TR>
							
								
							<TR>
								
								<TD  colspan=2 WIDTH="50%" align="left">
								<table border=0>
								<tr>
								<td nowrap WIDTH="10%" ALIGN="right">List of the Examinations:
								<td WIDTH="10%" ALIGN="right" nowrap>
								<select name=examname>
								<option value=""></option>
								
									<%
										for(int i=0;i<examsList.size();i++)
										{
											ExternalExam sub=(ExternalExam)examsList.get(i);
											
											%>
											<option value='<%=sub.getCode() %>'><%=sub.getDescription() %></option>
											<%
											
										}
									%>
									</select>
									</tr>
								<TR>
								<TD  WIDTH="10%" ALIGN="right">Branch: </TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="branch"><option></option><%
										if(degree.equals("M.TECH"))
										{
											%>
											<option value='MT-GI'>MT-GI</option><option value='MT-PE'>MT-PE</option>
											<option value='MT-VLSID'>MT-VLSID</option><option value='MT-CSE'>MT-CSE</option>
											<option value='MT-SE'>MT-SE</option>
									<% 
										}
										else
										{
									%>
									
									<option value="E.E.E">E.E.E</option> 
        							<option value="E.C.E">E.C.E</option> <option value="C.S.E">C.S.E</option> <option 
        							value="I.T">I.T</option> <option value="MECH">MECH</option> <option 
        							value="CIVIL">CIVIL</option>
        							<option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>
        							<option value="AI&DS">AI&DS</option>
        							
        							<%} %>
								</TD>
							</TR>
									
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
