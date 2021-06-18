
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
		<script language="javascript" src="./JS/datetimepicker.js"></script>
		
				<script language=javascript>

function populateSecValues(obj){
	// use here ajax call .. which will populate second box data
	var firstBoxValue = obj.value;
	var course=document.getElementById("degree").value;
	var sem=document.getElementById("sem").value;
	var ay=document.getElementById("ay").value;
	var reg=document.getElementById("reg").value;;
	var type=document.getElementById("type").value;;
	var period=document.getElementById("period").value;
	
	var urlString ="./examslist.jsp?course="+course+"&sem="+sem+"&ay="+ay+"&reg="+reg+"&type="+type+"&period="+period ;
	//alert(urlString);
	$.ajax({
	type: "POST",
	url: urlString ,
	success: function(result) {
	
		$("#exam").html(result);
	}
	});
	}

</script>		
		
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
					
	
					    <center><h3>Internals DataSheet Download</h3></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./internalssheetprogress.jsp">
							
							
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
								<select name="sem" id="sem">
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
								<select name="type" id="type">
								<option></option>
									<option value="REGULAR">Regular</option>
									 <option value="SUPPLEMENTARY">Supplementary</option>
									 <option value="REVALUATION">Revaluation</option>
								</select> 
        						</td>
        						</tr>
							
								<TD  WIDTH="20%" ALIGN="right" nowrap>Academic Year:<br>(yyyy-yyyy)</br> </TD>
								<td WIDTH="10%" ALIGN="left"><input maxlength="10" name="ay" id="ay"></td>
							</tr>
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Period </TD>
								<td WIDTH="10%" ALIGN="left">
								<select name="period" id="period">
								<option></option>
									<option value="ODD">ODD Semester</option>
									 <option value="EVEN">EVEN Semester</option>
									 
								</select> 
        						</td>
        						</tr>
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Regulation </TD>
								<td WIDTH="10%" ALIGN="left">
								<select id="reg" name=reg " onchange="populateSecValues(this)">
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
									</select></td></tr>
							   <TR>
							<tr>
							<td nowrap align=right> Name of the Examination:
							
							<td colspan=2 align=left>
							<select id=exam name="examname">
							
							
							</select>
						</td>
						</tr>
							<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Subject Type </TD>
								<td WIDTH="10%" ALIGN="left"><select name="stype" >
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
