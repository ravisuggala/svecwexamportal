
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 

<%@ page import = "dao.*,java.util.*" %>
<%
String header=new String();
User ur=(User)session.getAttribute("LoginRecord");
if(ur.getStatus().equals("admin"))
	header="./adminheader.jsp";
else if(ur.getStatus().equals("clerk"))
	header="./mainmenuheader.jsp";
else if(ur.getStatus().equals("ACE"))
	header="./aceheader.jsp";


ArrayList yoas=new StudentDB().getYoas();
ArrayList regs=new StudentDB().getRegulations();
	

%>
<jsp:include page='<%= header %>' flush="true" />

<html>
	<head>
		<title>SVECW--Examination Portal - External Examinations</title>
<script language="javascript" src="./JS/functions.js"></script>
<script language="javascript" src="./JS/datetimepicker.js"></script>
<script language=javascript>

function populateSecValues(obj){
	// use here ajax call .. which will populate second box data
	var firstBoxValue = obj.value;
	var course=document.getElementById("degree").value;
	var sem=document.getElementById("sem").value;
	var ay=document.getElementById("ay").value;
	var reg=document.getElementById("reg").value;;
	var yoa=document.getElementById("yoa").value;
	var urlString ="./feerevregistration2.jsp?course="+course+"&sem="+sem+"&ay="+ay+"&reg="+reg+"&yoa="+yoa+"&type=supply" ;
	
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
	<body>
		  <div id="centre">
					
	
					    <center><h1>Exam Fee Sheet for Supply Revaluation Examination</h1></center>
					    <CENTER>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./sprevfeesheet2.jsp">
							<TR>
								<TD  WIDTH="20%" ALIGN="right">Course:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="degree" id="degree"><option></option><option value="B.TECH">B.TECH</option> 
        							<option value="M.TECH">M.TECH</option> <option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>  </select>
								</TD>
									
        					
							
							<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Academic Year:<br>(yyyy-yyyy)</br> </TD>
								<td WIDTH="10%" ALIGN="left"><input maxlength="10" id="ay" name="ay"></td>
							</tr>
							<TR>
								<TD  WIDTH="20%" ALIGN="right" nowrap>Period: </TD>
								<td WIDTH="10%" ALIGN="left">
								<select name="period">
								<option></option>
									<option value="ODD">ODD Semester</option>
									 <option value="EVEN">EVEN Semester</option>
									 
								</select>
								</td>
							</tr>
							
        					<TR>
								<TD  WIDTH="20%" ALIGN="right">Type:</TD>
								<TD  WIDTH="10%" align="left">
									<select size="1" name="type" ><option></option><option value="general">General</option> 
        							<option value="fe">Free Elective</option>   </select>
								</TD>
							</TR>
        															
						<tr>
										<td nowrap WIDTH="20%" ALIGN="right">Last Date 1:
										<td nowrap WIDTH="10%" align="left">
<input id='demo1' type="text"  size="10" name='ldate1'><a href="javascript:NewCal('demo1','ddMMMyyyy')"><img src="./imgs/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
										</td>
									</tr>
								
							<TR>
							    <TD colspan=2 align="center">
							    <input type=hidden name="sprev" value="sprev"></input>
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
