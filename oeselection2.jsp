
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "dao.User,dao.StudentDB,java.util.ArrayList" %>


<%
String header=new String();
User ur=(User)session.getAttribute("LoginRecord");
if(ur.getStatus().equals("admin"))
	header="./adminheader.jsp";
else if(ur.getStatus().equals("clerk"))
	header="./mainmenuheader.jsp";
else if(ur.getStatus().equals("ACE"))
	header="./aceheader.jsp";

ArrayList regs=new StudentDB().getRegulations();

String degree=request.getParameter("degree");
String branch=request.getParameter("branch");
String sem=request.getParameter("sem");
String reg=request.getParameter("reg");

session.setAttribute("degree", degree);
session.setAttribute("branch", branch);
session.setAttribute("sem", sem);
session.setAttribute("reg", reg);

	
%>

<jsp:include page='<%= header %>' flush="true" />

<html>
	<head>
		<title>SVECW--Examination Portal - Mid Examinations</title>

<script>
function toggle(selectObj) {
	var selectIndex=selectObj.selectedIndex; 
	var selectValue=selectObj.options[selectIndex].text;
	if(selectValue=='Free Elective')
		{
			   document.getElementById("hidethis").style.display = '';
			 
		}
	else
		document.getElementById("hidethis").style.display = 'none';
	
}
function populateSecValues(obj){
	// use here ajax call .. which will populate second box data
	var reg = obj.value;
	var degree=document.getElementById("odegree").value;
	var branch=document.getElementById("obranch").value;
	var urlString ="./openelectivesubjects.jsp?reg="+reg+"&degree="+degree+"&branch="+branch ;
	//alert(urlString);
	$.ajax({
	type: "POST",
	url: urlString ,
	success: function(result) {
	//console.info("result"+result);
	$("#subject").html(result);
	}
	});
	}
</script>
		
	</head>
	<body>
		  <div id="centre">
	
					    <center><h1>Open Elective Selection</h1></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./oeselection3.jsp">
							<INPUT TYPE=HIDDEN NAME="hiddenActionType" VALUE = "midstep1">
							
							<TR>
							    <TD COLSPAN="2" ALIGN="center"><h3><b> Open Elective Selection</b></h3></TD>
							</TR>
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="odegree" id="odegree"><option></option><option value="B.TECH">B.TECH</option> 
        							<option value="M.TECH">M.TECH</option> <option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>  </select>
								</TD>
							<TR>
								<TD  WIDTH="10%" ALIGN="right">Branch: </TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="obranch" id="obranch"><option></option>
									<option value="B.S">B.S</option>
									<option value="E.E.E">E.E.E</option> 
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
								<TD  WIDTH="20%" ALIGN="right">Regulation </TD>
								<td WIDTH="10%" ALIGN="left">
								<select id="reg" name="reg" onchange="populateSecValues(this)">
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
							
							<tr>
							<td nowrap align=right> List of the Subjects:
							
							<td colspan=2>
							<select id=subject name="subject">
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
