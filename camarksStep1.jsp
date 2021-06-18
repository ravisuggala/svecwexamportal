
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "dao.User,dao.StudentDB,java.util.ArrayList" %>


<%
String header=new String();
User ur=(User)session.getAttribute("LoginRecord");


if(ur.getStatus().equals("admin"))
	header="./adminheader.jsp";
else if(ur.getStatus().equals("clerk"))
	header="./mainmenuheader.jsp";
ArrayList regs=new StudentDB().getRegulations();
	
%>

<jsp:include page='<%= header %>' flush="true" />

<html>
	<head>
		<title>SVECW--Examination Portal - Mid Examinations</title>

<script>
function toggle(selectObj) {
	var selectIndex=selectObj.selectedIndex; 
	var selectValue=selectObj.options[selectIndex].text;
	var degree=document.getElementById("degree").value;
	var branch=encodeURIComponent(document.getElementById("branch").value);
	var sem=document.getElementById("sem").value;
	var reg=document.getElementById("reg").value;

	if(selectValue=='Common')
	{
	var urlString ="./commonsubjects.jsp?degree="+degree+"&branch="+branch+"&sem="+sem+"&reg="+reg ;
	$.ajax({
	type: "POST",
	url: urlString ,
	success: function(result) {
	console.info("result"+result);
	$("#subject").html(result);
	}
	});
	
	
	document.getElementById("elerow").style.display = 'none';
	document.getElementById("hidethis").style.display = 'none';
	document.getElementById("subname").style.display = '';
		 
	}
	else if(selectValue=='Elective')
	{
	document.getElementById("subname").style.display = 'none';
	document.getElementById("hidethis").style.display = 'none';
	
	var urlString ="./eletypes.jsp?degree="+degree+"&branch="+branch+"&sem="+sem+"&reg="+reg ;
	$.ajax({
	type: "POST",
	url: urlString ,
	success: function(result) {
	console.info("result"+result);
	$("#elecat").html(result);
	}
	});
	
	document.getElementById("elerow").style.display = '';
	
	}
	else if(selectValue=='Free Elective')
		{
		document.getElementById("elerow").style.display = 'none';
		document.getElementById("subname").style.display = 'none';
		document.getElementById("hidethis").style.display = '';
		}
	else
		{
		document.getElementById("elerow").style.display = 'none';
		document.getElementById("hidethis").style.display = 'none';
		document.getElementById("subname").style.display = 'none';
		}
	}
function subjectselect(elecat)
{
	var ele=elecat.value;
	var urlString ="./electivesubjects.jsp?selele="+ele ;
	$.ajax({
	type: "POST",
	url: urlString ,
	success: function(result) {
	console.info("result"+result);
	$("#subject").html(result);
	}
	});
	
	document.getElementById("subname").style.display = '';
}
function fesubjectselect(elecat)
{
	var degree=document.getElementById("degree").value;
	var branch=encodeURIComponent(document.getElementById("branch").value);
	
	var reg=document.getElementById("reg").value;
	
	var ele=elecat.value;
	var urlString ="./fesubjects.jsp?selele="+ele+"&degree="+degree+"&branch="+branch+"&reg="+reg ;
	$.ajax({
	type: "POST",
	url: urlString ,
	success: function(result) {
	console.info("result"+result);
	$("#subject").html(result);
	}
	});
	
	document.getElementById("subname").style.display = '';
}
</script>
		
	</head>
	<body>
		  <div id="centre">
					
	
					    <center><h1>Course Activity Marks Entry</h1></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./camarksStep2.jsp">
							<INPUT TYPE=HIDDEN NAME="hiddenActionType" VALUE = "midstep1">
							
							<TR>
							    <TD COLSPAN="2" ALIGN="center"><h3><b> Branch Selection</b></h3></TD>
							</TR>
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="degree" id="degree"><option></option><option value="B.TECH">B.TECH</option> 
        							<option value="M.TECH">M.TECH</option> <option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>  </select>
								</TD>
							<TR>
								<TD  WIDTH="10%" ALIGN="right">Branch: </TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="branch" id="branch"><option></option><option value="E.E.E">E.E.E</option> 
        							<option value="E.C.E">E.C.E</option> <option value="C.S.E">C.S.E</option> <option 
        							value="I.T">I.T</option> <option value="MECH">MECH</option> <option 
        							value="CIVIL">CIVIL</option>
        							<option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>

        							<option value="AI&DS">AI&DS</option>

        							 </select>
								</TD>
							</TR>
							<TR>
								<TD  WIDTH="10%" ALIGN="right">Semester: </TD>
								<TD  WIDTH="10%" align="left">
								<select name="sem" id="sem">
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
								<TD  WIDTH="20%" ALIGN="right">Section </TD>
								<td WIDTH="10%" ALIGN="left">
								<select name="section">
								<option></option>
									<option value="A">A</option>
									 <option value="B">B</option>
									 <option value="C">C</option>
									 <option value="D">D</option>
									 <option value="E">E</option>
									 
        							</select>
        						</td>
        						</tr>
							
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Regulation </TD>
								<td WIDTH="10%" ALIGN="left">
								<select id="reg" name="reg">
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
									</select> 
        						</td></tr>
							
							<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Academic Year:<br>(yyyy-yyyy)</br> </TD>
								<td WIDTH="10%" ALIGN="left"><input maxlength="10" name="ay"></td></tr>
								
							
											<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Subject Category </TD>
								<td WIDTH="10%" ALIGN="left">
								<select name="cat" onChange="toggle(this);">
								<option value=""></option>
								<option value="common">Common</option>
								<option value="elective">Elective</option>
								<option value="fe">Free Elective</option>
								</select>
								</td></tr>
							<TR id="elerow" style="display:none">
								<TD  WIDTH="20%" ALIGN="right" nowrap>Elective Category </TD>
								<td WIDTH="10%" ALIGN="left">
								<select name="elecat" id="elecat" onChange="subjectselect(this);">
								</select> 
        						</td></tr>
							
							<TR id="hidethis" style="display:none">
								<TD  WIDTH="20%" ALIGN="right" nowrap>Free Elective Category </TD>
								<td WIDTH="10%" ALIGN="left">
								<select name="fe" onChange="fesubjectselect(this);">
								<option value="-">-</option>
									<option value="Free Elective-I">Free Elective-I</option>
								    <option value="Free Elective-II">Free Elective-II</option>
									<option value="Free Elective-III">Free Elective-III</option>
        						</select> 
        						</td></tr>
							
							<TR id="subname" style="display:none">
								<TD  WIDTH="20%" ALIGN="right" nowrap>Name of the Subject </TD>
								<td WIDTH="10%" ALIGN="left">
								<select name="subject" id="subject">
									
        						</select> 
        						</td></tr>
				
        						
							
							
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
