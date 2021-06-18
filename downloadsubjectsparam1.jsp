
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	
	<%@ page import = "java.util.*,dao.*" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "stdb" scope="session" class="dao.StudentDB" />
<jsp:useBean id = "subdb" scope="session" class="dao.SubjectDB" />
<%
ArrayList degrees=stdb.getDegrees();


ArrayList regs=subdb.getRegulations();

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
					
	
					    <center><h3>Download Subjects</h3></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./ActionServlet">
							
							<INPUT TYPE=HIDDEN NAME="option" VALUE = "downloadsub">
							<TR>
							    <TD COLSPAN="2" ALIGN="center"><h3><b> Course Selection</b></h3></TD>
							</TR>
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select name=degree>
								<option value=""></option>
								
									<%
										for(int i=0;i<degrees.size();i++)
										{
											String degree=degrees.get(i).toString();
											
											%>
											<option value='<%=degree %>' ><%=degree %></option>
											<%
											
										}
									%>
									</select>
									
									
								</TD>
							<tr>
							<TD  WIDTH="10%" ALIGN="right" nowrap>Semester: </TD>
							
							
							
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
        							</select></TD>							
												
							</tr>
							<tr>
							<TD  WIDTH="10%" ALIGN="right" nowrap>Regulation: </TD>
							<td WIDTH="10%" align="left">
							
							<select name=reg>
								<option value=""></option>
								
									<%
										for(int i=0;i<regs.size();i++)
										{
											String reg=regs.get(i).toString();
											
											%>
											<option value='<%=reg %>' ><%=reg %></option>
											<%
											
										}
									%>
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
