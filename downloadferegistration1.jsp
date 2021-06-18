
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 

<%@ page import = "dao.User" %>
	<%@ page import = "java.util.*,dao.*" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "stdb" scope="session" class="dao.StudentDB" />
<jsp:useBean id = "subdb" scope="session" class="dao.SubjectDB" />
<%
ArrayList degrees=stdb.getDegrees();
ArrayList yoas=stdb.getYoas();

ArrayList regs=subdb.getRegulations();

%>	

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

<script language=javascript>

function populateSecValues(obj){
	// use here ajax call .. which will populate second box data
	var firstBoxValue = obj.value;
	
	var elt1=document.getElementById("degree");
	var degree=elt1.options[elt1.selectedIndex].text;
	
	var elt2=document.getElementById("sem");
	var sem=elt2.options[elt2.selectedIndex].value;
	
	var elt3=document.getElementById("ay").value;
	var elt4=document.getElementById("reg");
	var reg=elt4.options[elt4.selectedIndex].value;
	var elt5=document.getElementById("yoa");
	var yoa=elt5.options[elt5.selectedIndex].value;
	
	var elt6=document.getElementById("type");
	var type=elt6.options[elt6.selectedIndex].value;
	
	var urlString ="./examnames1.jsp?degree="+degree+"&sem="+sem+"&ay="+elt3+"&reg="+reg+"&yoa="+yoa+"&type="+type ;
	$.ajax({
	type: "POST",
	url: urlString ,
	success: function(result) {
	console.info("result"+result);
	$("#exam").html(result);
	}
	});
	}

</script>

		
	</head>
	<body>
		  <div id="centre">
					
	
					    <center><h1>Free Elective Registration</h1></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./fedownloadprogress.jsp">
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="degree" id="degree"><option></option><option value="B.TECH">B.TECH</option> 
        							<option value="M.TECH">M.TECH</option> <option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>  </select>
								</TD>
							<TR>
								<TD  WIDTH="10%" ALIGN="right">Semester: </TD>
								<TD  WIDTH="10%" align="left">
								<select name="sem" id=sem>
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
								<td WIDTH="10%" ALIGN="left"><input maxlength="10" name="ay" id=ay></td>
							</tr>
									
        							<TR>
								<TD  WIDTH="10%" ALIGN="right">Branch: </TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="branch" id="branch" ><option></option><option value="E.E.E">E.E.E</option> 
        							<option value="E.C.E">E.C.E</option> <option value="C.S.E">C.S.E</option> <option 
        							value="I.T">I.T</option> <option value="MECH">MECH</option> <option 
        							value="CIVIL">CIVIL</option>
        							<option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>
        							<option value="AI&DS">AI&DS</option>
        							 </select>
								</TD>
							</TR>
   						 <tr>
							<TD  WIDTH="10%" ALIGN="right" nowrap>Regulation: </TD>
							<td WIDTH="10%" align="left">
							
							<select name=reg id=reg>
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
							<tr>
							<TD  WIDTH="10%" ALIGN="right" nowrap>Year of Admission: </TD>
							<td WIDTH="10%" align="left">
							
							<select name=yoa id=yoa >
								<option value=""></option>
								
									<%
										for(int i=0;i<yoas.size();i++)
										{
											String sub=yoas.get(i).toString();
											
											%>
											<option value='<%=sub %>' ><%=sub %></option>
											<%
											
										}
									%>
									</select>
							</td>
							</tr>
								<TR>
								<TD  WIDTH="10%" ALIGN="right">Exam Type: </TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="type" id="type" onchange="populateSecValues(this)" ><option></option><option value="regular">Regular</option> 
        							<option value="supply">Supplementary</option> <option value="revaluation">Revaluation</option> 
        							 </select>
								</TD>
							</TR>
							<tr>
							<td nowrap align=right> Name of the Examination:
							
							<td colspan=2>
							<select id=exam name="examname">
							
							
							</select>
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
