<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%@page import="dao.ExternalExamDB,java.util.ArrayList,excel.ExcelRegistrations" %>
<jsp:useBean id="miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />

<% 
	
	
    String degree=miscUtil.noNull(request.getParameter("degree"));
	String ay= miscUtil.noNull(request.getParameter("ay"));
	String period=miscUtil.noNull(request.getParameter("period"));
	
	ArrayList list=new ExternalExamDB().getTotalExams(degree,ay,period);
	
	ServletContext servletContext = session.getServletContext();
    String fname=degree.replace(".", "")+"_"+ay+"_"+period+"_totalexamsdetails.xls";
    String relativeWebPath = "excelfiles/"+fname;
    String absoluteDiskPath = servletContext.getRealPath(relativeWebPath);
    
    
    ExcelRegistrations pr=new ExcelRegistrations();
    pr.exportTotalExamsList(list,absoluteDiskPath);
    
    session.setAttribute("filename", relativeWebPath);
	session.setAttribute("fname", fname);
	session.setAttribute("filetype", "xl");
	session.setAttribute("report", "Total Exams List");
    
%>

<script language=javascript>
document.writeln("<br><br><br><br><br><br><br><br><center><h1>Please wait..Downloading...</center></h1>")
	setTimeout("location.href = './downloadreport.jsp';",5000);
</script>



</body>
</html>