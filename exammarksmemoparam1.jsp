
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
		<script language="javascript" src="./JS/datetimepicker.js"></script>
</head>	
	<%@ page import = "java.util.*,dao.*" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "stdb" scope="session" class="dao.StudentDB" />

<%
ArrayList yoas=stdb.getYoas();
ArrayList regs=stdb.getRegulations();

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
	
	
	<body>
		  <div id="centre">
					
	
					    <center><h3>Marks Memo DataSheet Download</h3></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./exammarksmemoparam2.jsp">
							
							
							<TR>
							    <TD COLSPAN="2" ALIGN="center"><h3><b> Course Selection</b></h3></TD>
							</TR>
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="degree" id="degree"><option></option><option value="B.TECH" >B.TECH</option> 
        							<option value="M.TECH" >M.TECH</option> <option value="M.B.A" >M.B.A</option> <option 
        							value="M.C.A" >M.C.A</option>  </select>
								</TD>
						<TR>
								<TD  WIDTH="10%" ALIGN="right"> Semester: </TD>
								<TD  WIDTH="10%" align="left">
								<select name="sem">
								<option></option>
									<option value="I-I" >I YEAR - I SEM</option> 
        							<option value="I-II" >I YEAR - II SEM</option> 
        							<option value="II-I" >II YEAR - I SEM</option> 
        							<option value="II-II" >II YEAR - II SEM</option> 
        							<option value="III-I" >III YEAR - I SEM</option>
        							<option value="III-II" >III YEAR - II SEM</option>
        							<option value="IV-I" >IV YEAR - I SEM</option>
        							<option value="IV-II" >IV YEAR - II SEM</option>
        							</select></TD></TR>
        							<TR>
								<TD  WIDTH="20%" ALIGN="right">Type </TD>
								<td WIDTH="10%" ALIGN="left">
								<select name="type">
								<option></option>
									<option value="regular">Regular</option>
									 <option value="supply">Supplementary</option>
									 <option value="revaluation">Revaluation</option>
								</select> 
        						</td>
        						</tr>
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Regulation </TD>
								<td WIDTH="10%" ALIGN="left">
								<select id="reg" name=reg ">
								<option value="-">-</option>
								
									<%
										for(int i=0;i<regs.size();i++)
										{
											String sub=regs.get(i).toString();
											
											%>
											<option value='<%=sub %>'><%=sub %></option>
											<%
											
										}
									%>
									</select>        						</td></tr>
							
        						<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Academic Year:<br>(yyyy-yyyy)</br> </TD>
								<td WIDTH="10%" ALIGN="right"><input maxlength="10" name="ay"></td>
							</tr>
							<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Subject Type </TD>
								<td WIDTH="10%" ALIGN="right"><select name="stype">
								<option></option>
									<option value="general">General</option>
									 <option value="fe">Free Elective</option>
        							</select> 
        					</td>
							</tr>
													
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
	<br></br>
	</body>
</html>
