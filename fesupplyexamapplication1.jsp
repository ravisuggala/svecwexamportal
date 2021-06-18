
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 

<%@ page import = "dao.User,java.util.*" %>
<jsp:useBean id = "stdb" scope="session" class="dao.StudentDB" />
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
<link rel="stylesheet" type="text/css" href="CSS/StyleCalender.css">

<script type="text/javascript" language="javascript" src="JS/CalendarControl.js"></script>
		
	</head>
	<body>
		  <div id="centre">
					
	
					    <center><h1>External Examination Application Generation</h1></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./fesupplyexamapplicationprogress.jsp">
							
							<INPUT TYPE=HIDDEN NAME="option" VALUE = "examapplication1">
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="degree"><option></option><option value="B.TECH">B.TECH</option> 
        							<option value="M.TECH">M.TECH</option> <option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>  </select>
								</TD>
									
        					<tr>
							<td WIDTH="20%" ALIGN="right" nowrap>Month</td>
							<td>
							<input name="month" type="text" id="dpMonthYear" value="" style="width:80px;" />
							<img alt="Month/Year Picker" onclick="showCalendarControl('dpMonthYear');" 
				src="imgs/datepicker.gif" />
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
