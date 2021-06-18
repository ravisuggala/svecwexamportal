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


<script language="javascript">
function optiondisplay()
{
	document.cmbentry.submit();
	
}
</script>

	

<body>


<br></br>
<br></br>
<center>

<form name="import" action="./ActionServlet" method="post" >
<INPUT TYPE=HIDDEN NAME="option" VALUE = "jntust">
<table>
<tr>
<th colspan=2 align=center><center>JNTU Sheet for Student</center> </th>
<TR>
								<TD   ALIGN="right">Course:</TD>
								<TD   align="left">
									<select size="1" name="degree" ><option></option><option value="B.TECH">B.TECH</option> 
        							<option value="M.TECH">M.TECH</option> <option value="M.B.A">M.B.A</option> <option 
        							value="M.C.A">M.C.A</option>  </select>
								</TD>
								</tr>
<tr>
<td> Student Registration Number:</td>

<td><input type="text" name="regdno"></input></td></tr>
<tr><td colspan=2 align=center>
<input type="submit" value="Download"></input>
</td></tr>
</table>
</form>
</center>

<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>






		