
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
					
	
					    <center><h1>Download-Fee Portal Sheet</h1></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./feesheetprogress.jsp">
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
								<TD  WIDTH="20%" ALIGN="right" nowrap>Examination type:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="examtype" ><option></option><option value="SUPPLEMENTARY">SUPPLEMENTARY</option> 
        							<option value="REVALUATION">REVALUATION</option> <option value="REGULAR">REGULAR</option> 
        						  </select>
								</TD>
							</TR>
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Type:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="type" ><option></option><option value="general">General</option> 
        							<option value="fe">Free Elective</option>   </select>
								</TD>
							</TR>
						  	<TR>
								<TD  WIDTH="20%" ALIGN="right">Semester:</TD>
								<TD  WIDTH="10%" align="left" nowrap>
									<input type=checkbox value='I-I' name=sem>&nbsp;&nbsp;I-I</input>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type=checkbox value='I-II' name=sem>&nbsp;&nbsp;I-II</input>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type=checkbox value='II-I' name=sem>&nbsp;&nbsp;II-I</input>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type=checkbox value='II-II' name=sem>&nbsp;&nbsp;II-II</input>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type=checkbox value='III-I' name=sem>&nbsp;&nbsp;III-I</input>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type=checkbox value='III-II' name=sem>&nbsp;&nbsp;III-II</input>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type=checkbox value='IV-I' name=sem>&nbsp;&nbsp;IV-I</input>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type=checkbox value='IV-II' name=sem>&nbsp;&nbsp;IV-II</input>&nbsp;&nbsp;&nbsp;&nbsp;
								</TD>
							</TR>
							
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
