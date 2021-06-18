
<head>
<script language="javascript" src="./JS/functions.js"></script>
</head>
<%@ page import = "java.util.*,dao.*" %>

<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "stdb" scope="session" class="dao.StudentDB" />
<%
ArrayList students=new ArrayList();

String degree=session.getValue("degree").toString();
String branch=session.getValue("branch").toString();
String sem=session.getValue("sem").toString();
String section=session.getValue("section").toString();
String reg=session.getValue("reg").toString();
String ay=session.getValue("ay").toString();
String yoa=session.getValue("yoa").toString();
String selele="";
selele=miscUtil.noNull(request.getParameter("selele"));
if(selele.equals(""))
	selele=session.getValue("selele").toString();
session.putValue("selele", selele);
String subject="";
subject=miscUtil.noNull(request.getParameter("subject"));
if(subject.equals(""))
	subject=session.getValue("subject").toString();
session.putValue("subject", subject);
students=stdb.getNotMappedStudentList(degree, branch, sem,section,reg,ay,selele,yoa);

%>

<script language=javascript>

function toggle(source) {
	  checkboxes = document.getElementsByName('ToLB');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
	    checkboxes[i].checked = source.checked;
	  }
	}
	

function untoggleall(source) {
	var flg=0;
	all=document.getElementById('all');
	  checkboxes = document.getElementsByName('ToLB');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
		  if(checkboxes[i].checked==false)
			  {
			  flg=1;
			  break;
			  }
	  }
	  if(flg==0)
		  all.checked=true;
	  else
		  all.checked=false;
	}
	
</script>		


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
		<title>SVECW - Examination Portal - Electives Mapping</title>
		
	</head>
	<body>
		  <div id="centre">
			    <center><h1>Elective Mapping - Step 3 of 4</h1></center>
			    <CENTER>
						<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="300">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./FinalElectiveMap.jsp" >
							<INPUT TYPE=HIDDEN NAME="hiddenActionType" VALUE = "MapElective3">
							<TR>
							    <TD COLSPAN="3" ALIGN="center"><h6><b> Student List for  <%=selele %></b></h6></TD>
							</TR>
							
							<table BORDER="1" CELLPADDING="2" CELLSPACING="2">
							<tr>
							<th>Sl.No
							<th>Regd.No
							<th align=center><input type="checkbox" id ="all" onClick="toggle(this)" /></th>
							</tr>
							
							
							<%
							for(int i=0;i<students.size();i++)
							{
								
								
						   %>
							<tr>
							<td><%=i+1 %>
							<td nowrap><%=students.get(i) %></td>
							<TD align=center><input type="checkbox" name="ToLB" value='<%=students.get(i) %>' onclick="untoggleall(this)"></input>
							<input type="hidden" name="regdnos_option" value='<%=students.get(i) %>' />
							</TD>
							</tr>
							
							<%} // onClick="selectAllitems()" %>
							
							
								<tr>
							<TD colspan=3 align="center"><INPUT TYPE="SUBMIT" NAME="Next" VALUE="..Next-->" ></INPUT></TD>
							
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