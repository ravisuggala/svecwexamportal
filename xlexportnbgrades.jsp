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



<br></br>
<br></br>
<br></br>
<center>
<font face="tahoma" size=3 color=red><%=session.getAttribute("examname") %> Notice Board Sheet. <br><a href="./DownloadNBResults"> <br><br><img src="./imgs/download.jpg" align=center width=150 height=40></img></a></font> 

</center>	
	
<br></br>
<br></br>
<br></br>





		