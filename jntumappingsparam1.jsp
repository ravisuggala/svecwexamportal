
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
		
	</head>
	<body>
		  <div id="centre">
					
	
					    <center><h1>Subject Mappings Sheet for JNTU</h1></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./jntumappingsprogress.jsp">
							
							<INPUT TYPE=HIDDEN NAME="option" VALUE = "jntuexams">
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="degree"><option></option><option value="B.TECH">B.TECH</option> 
        							<option value="M.TECH">M.TECH</option> <option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>  </select>
								</TD>
							
							</tr>
        					
							
							<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Academic Year:<br>(yyyy-yyyy)</br> </TD>
								<td WIDTH="10%" ALIGN="right"><input maxlength="10" name="ay"></td>
							</tr>
							
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
