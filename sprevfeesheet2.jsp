
<head>
<script language="javascript" src="./JS/functions.js"></script>
</head>
<%@ page import = "java.util.*,dao.*" %>

<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "stdb" scope="session" class="dao.StudentDB" />
<%


String degree=miscUtil.noNull(request.getParameter("degree"));
String ay=miscUtil.noNull(request.getParameter("ay"));
String period=miscUtil.noNull(request.getParameter("period"));
String type=miscUtil.noNull(request.getParameter("type"));
String ldate1=miscUtil.noNull(request.getParameter("ldate1"));

session.putValue("degree", degree);
session.putValue("ay", ay);
session.putValue("period", period);
session.putValue("type", type);
session.putValue("ldate1", ldate1);

ArrayList exams=new ExternalExamDB().getSupplyExamsList(degree,ay,period);



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
		<title>SVECW - Examination Portal - Revaluation Fee Sheet</title>
		
	</head>
	<body>
		  <div id="centre">
			    <center><h2>Supplementary Examination List</h2></center>
			    <CENTER>
						<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="300">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./sprevfeesheetprogress.jsp" >
							<INPUT TYPE=HIDDEN NAME="hiddenActionType" VALUE = "MapElective3">
							<TR>
							    <TD COLSPAN="3" ALIGN="center"><h6><b> <%=ay %> Examination List</b></h6></TD>
							</TR>
							
							<table BORDER="1" CELLPADDING="2" CELLSPACING="2">
							<tr>
							<th>Sl.No
							<th>Examination
							<th align=center><input type="checkbox" id ="all" onClick="toggle(this)" /></th>
							</tr>
							
							
							<%
							for(int i=0;i<exams.size();i++)
							{
								
								ExternalExam ee=(ExternalExam)exams.get(i);
						   %>
							<tr>
							<td><%=i+1 %>
							<td nowrap><%=ee.getDescription() %></td>
							<TD align=center><input type="checkbox" name="ToLB" value='<%=ee.getCode() %>' onclick="untoggleall(this)"></input>
							<input type="hidden" name="regdnos_option" value='<%=ee.getCode() %>' />
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
