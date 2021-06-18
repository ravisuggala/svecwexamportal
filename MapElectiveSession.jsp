
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
%>
<jsp:include page='<%= header %>' flush="true" />

<html>
	<head>
		<title>Subjects Mapping</title>
<script>
function toggle(selectObj) {
	var selectIndex=selectObj.selectedIndex; 
	var selectValue=selectObj.options[selectIndex].text;
	var degree=document.getElementById("degree").value;
	var branch=document.getElementById("branch").value;
	var sem=document.getElementById("sem").value;
	var reg=document.getElementById("reg").value;

    var urlString ="./eletypes.jsp?degree="+degree+"&branch="+branch+"&sem="+sem+"&reg="+reg ;
	$.ajax({
	type: "POST",
	url: urlString ,
	success: function(result) {
	console.info("result"+result);
	$("#elecat").html(result);
	}
	});
	
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
	
	
}
</script>		
	</head>
	<body>
<%@ page import = "java.util.*,dao.*" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<%
HashMap subjectsList = (HashMap)session.getAttribute("electives");
String selele=new String();
selele=miscUtil.noNull(session.getValue(("selele")));
	

ArrayList slist=(ArrayList)subjectsList.get(selele);


%>
		  <div id="centre">
					
	
					    <center><h1>Elective Mapping - Step 1 of 3</h1></center>
					    <CENTER><br></br>
					    	<TABLE BORDER="1" CELLPADDING="2" CELLSPACING="2" WIDTH="290">
							<FORM NAME = REGISTER METHOD = POST ACTION = "./MapElective3.jsp">
							<INPUT TYPE=HIDDEN NAME="hiddenActionType" VALUE = "MapElective1">
							
							<TR>
							    <TD COLSPAN="2" ALIGN="center"><h3><b> Subject Selection</b></h3></TD>
							</TR>
							
							<TR id="subname" >
								<TD  WIDTH="20%" ALIGN="right" nowrap>Name of the Subject </TD>
								<td WIDTH="10%" ALIGN="left">
								<select name="subject" id="subject">
									<option value='' selected></option>
									<% 
         							for(int i=0;i<slist.size();i++)
									{
										Subject sub=(Subject)slist.get(i);
									    String code=sub.getCode();
								   		String name=sub.getSname();
								   	%>	
									<option value='<%=code%>'><%=name%></option>
								    <%} %>
									
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
