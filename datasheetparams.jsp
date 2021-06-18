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
		<title>SVECW-Examination Portal</title>
		
	</head>
	<body>
		  <div id="centre">
					
	
					    <center><h3>Internal Examinations Report</h3></center>
					    <CENTER><br></br>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./ActionServlet">
							<INPUT TYPE=HIDDEN NAME="option" VALUE = "middatasheet">
							
							<TR>
							    <TD COLSPAN="2" ALIGN="center"><h3><b> Branch Selection</b></h3></TD>
							</TR>
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="degree" ><option></option><option value="B.TECH">B.TECH</option> 
        							<option value="M.TECH">M.TECH</option> <option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>  </select>
								</TD>
							<TR>
								<TD  WIDTH="10%" ALIGN="right">Semester: </TD>
								<TD  WIDTH="10%" align="left">
								<select name="sem">
								<option></option>
									<option value="I-I">I YEAR - I SEM</option> 
        							<option value="I-II">I YEAR - II SEM</option> <option value="II-I">II YEAR - I SEM</option> <option 
        							value="II-II">II YEAR - II SEM</option> 
        							<option value="III-I">III YEAR - I SEM</option>
        							<option value="III-II">III YEAR - II SEM</option>
        							<option value="IV-I">IV YEAR - I SEM</option>
        							<option value="IV-II">IV YEAR - II SEM</option>
        							</select></TD></TR>
        							
							
							
							<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Academic Year:<br>(yyyy-yyyy)</br> </TD>
								<td WIDTH="10%" ALIGN="right"><input maxlength="10" name="ay"></td></tr>
							
							<TR>
								<TD  WIDTH="10%" ALIGN="right">Subject Category: </TD>
								<TD  WIDTH="10%" align="left">
								<select name="subcat">
								<option></option>
									<option value="general">General Subjects</option> 
        							<option value="FE">Free Elective</option> 
        							</select></TD></TR>
        					

							<TR>
							    <TD colspan=2 align="center">
							    <INPUT TYPE="SUBMIT" NAME="Next" VALUE="..Next-->"></INPUT></TD>

							</TR>
							</FORM>
						</TABLE>
					    </CENTER>			  
  		  </div>
		<div id="pied"></div>
	</div>
	<br></br>
	<br></br>
	</body>
</html>
