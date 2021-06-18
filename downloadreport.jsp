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


	

%>




<%

String report=session.getAttribute("report").toString();
//String filename="http://localhost:8080/svecwexamportal/"+session.getAttribute("filename").toString();
String filename="http://10.0.32.159:8080/svecwexamresults/"+session.getAttribute("filename").toString();
%>


<jsp:include page='<%= header %>' flush="true" />


<br></br>
<br></br>
<br></br>
<center>
<font face="tahoma" size=3 color=red><%=report %><br> <a href=<%=filename %>> <br><br><img src="./imgs/download.jpg" align=center width=150 height=40></img></a></font> 

</center>	
	
<br></br>
<br></br>
<br></br>





		