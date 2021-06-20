
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 

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
		<script language="javascript" src="./JS/datetimepicker.js"></script>
		
	</head>
	<body>
		  <div id="centre">
					
	
					    <center><h1>Download-Fee Portal Sheet for Regular Examination</h1></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./regfeesheetprogress.jsp">
							<INPUT TYPE=HIDDEN NAME="hiddenActionType" VALUE = "xternalstep1">
							<INPUT TYPE=HIDDEN NAME="option" VALUE = "feesheet">
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="degree" ><option></option><option value="B.TECH">B.TECH</option> 
        							<option value="M.TECH">M.TECH</option> <option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>  </select>
								</TD>
							</TR>
							
							
						  	<TR>
								<TD  WIDTH="10%" ALIGN="right">Semester: </TD>
								<TD  WIDTH="10%" align="left">
								<select name="sem">
								<option></option>
									<option value="I-I">I YEAR - I SEM</option> 
        							<option value="I-II">I YEAR - II SEM</option>
        							 <option value="II-I">II YEAR - I SEM</option> 
        							 <option value="II-II">II YEAR - II SEM</option> 
        							<option value="III-I">III YEAR - I SEM</option>
        							<option value="III-II">III YEAR - II SEM</option>
        							<option value="IV-I">IV YEAR - I SEM</option>
        							<option value="IV-II">IV YEAR - II SEM</option>
        							</select></TD></TR>
        					
							<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Academic Year:<br>(yyyy-yyyy)</br> </TD>
								<td WIDTH="10%" ALIGN="left"><input maxlength="10" name="ay"></td>
							</tr>
								<tr>
										<td nowrap WIDTH="20%" ALIGN="right">Last Date 1:
										<td nowrap WIDTH="10%" align="left">
<input id='demo1' type="text"  size="10" name='ldate1'><a href="javascript:NewCal('demo1','ddMMMyyyy')"><img src="./imgs/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
										</td>
									</tr>
									<tr>
										<td nowrap WIDTH="20%" ALIGN="right">Last Date 2:
										<td nowrap WIDTH="10%" align="left">
<input id='demo2' type="text"  size="10" name='ldate2'><a href="javascript:NewCal('demo2','ddMMMyyyy')"><img src="./imgs/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
										</td>
									</tr>	
									<tr>
										<td nowrap WIDTH="20%" ALIGN="right">Last Date 3:
										<td nowrap WIDTH="10%" align="left">
<input id='demo3' type="text"  size="10" name='ldate3'><a href="javascript:NewCal('demo3','ddMMMyyyy')"><img src="./imgs/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
										</td>
									</tr>					
							<TR>
							    <TD colspan=2 align="center">
							    <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Submit"></INPUT></TD>

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
