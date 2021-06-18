
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
String code=new String();
String reg=new String();
ArrayList studentsList=new ArrayList();
ArrayList subjectsList=new ArrayList();
ArrayList maplist=new ArrayList();

HashMap mapelectives=new HashMap();

String target=miscUtil.noNull(session.getValue(("target")));
if(target.equals("status"))
{
	degree=session.getValue("degree").toString();
	
	sem=session.getValue("sem").toString();
	
	ay=session.getValue("ay").toString();
	
	

}
else
{
	degree=session.getValue("degree").toString();
	 
	 sem=session.getValue("sem").toString();
	 
	 ay=session.getValue("ay").toString();
	 
	 code=session.getValue("examname").toString();
	 branch=session.getValue("branch").toString();
	 
	String selele=miscUtil.noNull(request.getParameter("elecat"));
	
			ExternalExamDB eedb=new ExternalExamDB();
			ExternalExam ee=eedb.getExamInfo(code);
	        reg=ee.getReg();
			String info=eedb.isExistedForElective(code,sem,branch,ee.getReg(),selele);
			if(info.equals("0"))
			{
				MapSubjectDB mdb=new MapSubjectDB();
				
				maplist=mdb.getMapSubjectsList(code,branch, sem, ee.getReg(), ay);
				
				subjectsList=mdb.getMapSubjectsByGroup(branch, sem, ee.getReg(), ay);
				studentsList=mdb.getMapStudentsByGroup(branch, sem, ee.getReg(), ay);
				
				session.putValue("maplist", maplist);
				session.putValue("studentslist",studentsList);
				session.putValue("subjectslist", subjectsList);
				
				 mapelectives=mdb.getMappedElectives(code,branch,sem,ee.getReg(),ay,selele);
				 
				 session.putValue("mapelectives", mapelectives);
				
			}
			else
			{
				miscUtil.writeToSession(request, response, "error", info);
				miscUtil.forwardToPage(request, response, "./errors.jsp");
			}
	}
	
	


	//System.out.println("in else");
	
String disp=sem+" "+branch+" Elective Details";
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
		<script language="javascript" src="./JS/functions.js"></script>
	</head>
	<body>
		  <div id="centre">
			    <center><h2>External Examinations Registration</h2></center>
			    <CENTER>
			    <FORM NAME = REGISTER METHOD = POST ACTION = "./ActionServlet">
							<INPUT TYPE=HIDDEN NAME="hiddenActionType" VALUE = "xternalstep3">
							
						<TABLE BORDER="1"  width=35%>
							<TR>
							    <TD COLSPAN="4" ALIGN="center"><h2><b> <%=disp%></b></h2></TD>
							</TR>
							
							
							<TR>
										<th>Sl.No</th>
										<th>Regd.No</th>
										<th>Name of the Student</th>
										<th><input type=checkbox id="regds" name=regds value="rall" onClick="toggle(this,'regdnos')"></input></th> 
							</tr>
									<%
									ArrayList sublist=new ArrayList(mapelectives.keySet());
									int stcnt=1;
									for(int i=0;i<sublist.size();i++)
									{ 
									  String subj=sublist.get(i).toString();
									%>
									<tr>
									<td colspan=4 nowrap><%= new SubjectDB().getSubjectTitle(subj,reg)+"("+subj+")"%>
							        <% 
							        ArrayList stlist=(ArrayList)mapelectives.get(subj);
							        
							        for(int j=0;j<stlist.size();j++)
									{ 
									  MapSubject st=(MapSubject)stlist.get(j);
									%>
									
								    <tr>
										<td width=10% nowrap align="right"><%=stcnt++ %>
										<td nowrap width=18%><%=st.getRegdno() %>
										<td nowrap><font size=1><%=new StudentDB().getStudentName(st.getRegdno()) %></font>
										<td nowrap ><input type=checkbox name=regdnos value=<%=st.getRegdno() %> onclick="deSelectAll('regdnos','regds')"></input></td>
									</tr>
									<% }
									}
									%>
									
										
							
									<input type=hidden name="option" value="electiveregistration"></input>					
							<TR>
								<TD colspan=4  align="center"><INPUT TYPE="SUBMIT" NAME="Next" VALUE="Submit"></INPUT></TD>
								
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
