<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "java.util.*,dao.*" %>
<html>
	<head>
		<title>SVECW---Examination Portal</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />
		<link rel="stylesheet" href="./CSS/styles.css" />
		<style media="all" type="text/css">@import "./menu/menu-style.css";</style>
		
		
		<script src="JS/jquery-1.4.2.min.js"></script>
	<script language="javascript">
	
	$(document).ready(function () {
	    $("#degree").change(function () {
	        var val = $(this).val();
	        if (val == "M.TECH") {
	           $("#branch").html("<option></option><option value='MT-GI'>MT-GI</option><option value='MT-PE'>MT-PE</option><option value='MT-VLSID'>MT-VLSID</option><option value='MT-CSE'>MT-CSE</option><option value='MT-SE'>MT-SE</option>");
	        }
	        if (val == "B.TECH") {
		           $("#branch").html("<option></option><option value='E.E.E'>E.E.E</option><option value='E.C.E'>E.C.E</option> <option value='C.S.E'>C.S.E</option> <option value='I.T'>I.T</option> <option value='MECH'>MECH</option> <option value='CIVIL'>CIVIL</option><option value='AI&DS'>AI&DS</option>");
		        }
	        if (val == "M.B.A") {
		           $("#branch").html("<option value='M.B.A'>M.B.A</option>");
		        }
	        if (val == "M.C.A") {
		           $("#branch").html("<option value='M.C.A'>M.C.A</option>");
		        }
	    });
	});
	
	
	function selectOption(opt)
	{
		document.forms[0].option.value=opt;
		document.forms[0].submit();
		
	}
	function repwin()
	{
		
		document.REGISTER.submit();
		
	}
	function printtable()
	{
		var printContent = document.getElementById("centre");

		var windowUrl = 'about:blank';
		var num;

		var uniqueName = new Date(); 
		var windowName = 'Print' + uniqueName.getTime();
		var printWindow = window.open(num, windowName, 'left=50,top=50,width=800,height=900');

		printWindow.document.write(printContent.innerHTML);

		printWindow.document.close();

		printWindow.focus();

		printWindow.print();
	}

	function tabChange(i) {
	      for ( var j = 1; j <= 3; j++) {
	           if (i == j) {
	                document.getElementById("Page" + j).style.display = "block";
	                document.getElementById("Page" + j).className = "box";
	                document.getElementById("Tab" + j).className = "tabSelect";
	           } else {
	                document.getElementById("Page" + j).style.display = "none";
	                document.getElementById("Tab" + j).className = "tab";
	                
	           }
	      }
	}
		
	function entrytabChange(i) {
	      for ( var j = 1; j <= 2; j++) {
	           if (i == j) {
	                document.getElementById("Page" + j).style.display = "block";
	                document.getElementById("Page" + j).className = "box";
	                document.getElementById("Tab" + j).className = "tabSelect";
	           } else {
	                document.getElementById("Page" + j).style.display = "none";
	                document.getElementById("Tab" + j).className = "tab";
	                
	           }
	      }
	}
	
	
	
	</script>
	
	</head>
	<body>
	<div id="conteneur">
		  		  <div id="header"><img src="./imgs/one.jpg" width=80% height=150 align=left></div>
		  
		  
<%
User usr=(User)session.getAttribute("LoginRecord");
%>
<p align=left><font face="Lucida Grande" size=2 color=green>Logged User&nbsp;:&nbsp;<%=usr.getUname() %></font></p>

<nav>
<ul>

<li><a href="" target="_self" >New</a> 
<ul>
	<li> <a href="./studenttypes.jsp" > Students</a></li>
	<li> <a href="#" > Subjects</a>
	<ul>
		<li> <a href="./importsubjects.jsp" > General Subjects</a></li>
		<li> <a href="./importoesubjects.jsp"> Open Elective Subjects</a></li>
		<li> <a href="./importncsubjects.jsp" > Non-Credit Subjects</a></li>
		</ul>
	
	</li>
	<li> <a href="./oeselection1.jsp" > Open Elective Selection</a></li>
	<li> <a href="#" > Subjects Mapping</a>
		<ul>
		<li> <a href="#" onClick=selectOption("mapsub")> Common Subjects</a></li>
		<li> <a href="#" onClick=selectOption("mapelective")> Elective Subjects</a></li>
		<li> <a href="./freelectivemapping1.jsp"> Free Elective</a></li>
		</ul>
	</li>
</ul>
</li>

<li><a href="" target="_self" >Edit</a> 
<ul>
	
	<li> <a href="./promotionparam1.jsp"> Student Promotion</a></li>
	<li> <a href="./readmitparam1.jsp"> Student ReAdmission</a></li>
	<li> <a href="./setregulation.jsp"> Set Regulation</a></li>
	<li> <a href="./setresultsdate.jsp">Results Declaration Date</a></li>
	
</ul>
</li>


<li><a href="" target="_self" >Examinations</a>
<ul>
	<li> <a href="#"> External Examinations</a>
	<ul>
	<li><a href="./examapplication1.jsp" >Generate Exam Applications</a></li>
	<li><a href="#">Student Registration</a>
			<ul>
				<li> <a href="./examregistration1.jsp">Regular</a></li>
				<li> <a href="./revregistration1.jsp">Revaluation</a></li>
				<li> <a href="./supplyregistration1.jsp">Supplementary</a></li>
				<li> <a href="#">Free Elective</a>
					<ul>
						<li> <a href="./feregistration1.jsp">Regular</a></li>
						<li> <a href="./ferevregistration1.jsp">Revaluation</a></li>
						<li> <a href="./fesupplyregistration1.jsp">Supplementary</a></li>
					
					</ul>
				
				</li>
	    	</ul>
		</li>
		<li><a href="#">Exam TimeTable</a>
		<ul>
				<li> <a href="./examtimetableparams1.jsp">General</a></li>
				<li> <a href="./feexamtimetableparams1.jsp">Free Elective</a></li>
		</ul>
		</li>
	</ul>
	</li>
</ul>
</li>

<li><a href="" target="_self" >Downloads</a>
<ul>
	<li> <a href="#" > Internal Examinations</a>
		<ul>
		<li> <a href="#" onClick=selectOption("cmidmarks")> Consolidated Report</a></li>
		</ul>
	</li>
	<li> <a href="#" > External Examinations</a>
		<ul>
			<li><a href="#"> Registrations</a>
			<ul>
				<li> <a href="./downloadregistration1.jsp">Regular</a></li>
				<li> <a href="./revdownloadregistration1.jsp">Revaluation</a></li>
				<li> <a href="./downloadregistration1.jsp">Supplementary</a></li>
				<li> <a href="./downloadferegistration1.jsp">Free Elective</a></li>
			</ul>
			</li>
			<li><a href="./hallticketsparams1.jsp"> Halltickets</a></li>
			
			<li><a href="#"> Results</a>
			<ul>
			<li> <a href="nbresultsparam1.jsp"> Notice Board Sheets</a>
			<li> <a href="#"> Marks Memo Data Sheet</a>
			
			<ul>
				<li> <a href="./exammarksmemoparam1.jsp">Examination Wise</a></li>
				<li> <a href="./marksmemoparam1.jsp">Batch Wise</a></li>
				
			</ul>
		    </li>
			<li> <a href="./cmmparam1.jsp"> CMM Data Sheet</a></li>
			
			<li> <a href="#"> Aggregate Results</a>
			<ul>
				<li> <a href="./externalaggregateparam1.jsp">Examination Wise</a></li>
				<li> <a href="./batchresultsparam1.jsp">Batch Wise</a></li>
				<li> <a href="#"> Failure List</a>
				<ul>
					<li> <a href="./failedlistparam1.jsp">Student wise List</a></li>
					<li> <a href="./failedsubsparam1.jsp">Subject wise Failures</a></li>
				</ul>
				</li>
			</ul>
		    
			
			</li>
			</ul>
			</li>
		</ul>
		</li>
		<li> <a href="#" > Students </a>
		<ul>
		    <li><a href="#">  List</a>
			<ul>
				<li> <a href="./downloadstlist.jsp">Regular List</a></li>
				<li> <a href="#" onClick=selectOption("detainedlist")>Detained List</a></li>
				<li> <a href="#" onClick=selectOption("transferedlist")>Transferred List</a></li>
				<li> <a href="./downloadreregisterlist.jsp">Re-Registered List</a></li>
				<li> <a href="./downloadreadmittedlist.jsp">Re-Admitted List</a></li>
			</ul>
			</li>
			<li><a href="">  Credits Report</a>
			
			<ul>
				<li> <a href="./externalcreditsparam1.jsp">Total Credits Report</a></li>
				<li> <a href="./semwisecreditsparam1.jsp" >Sem wise Credits Report</a></li>
			</ul>
			</li>
			</ul>
		</li>
	
		<li> <a href="./downloadsubjectsparam1.jsp"> Subjects</a></li>
		
		<li> <a href="#"> Free Elective</a>
			<ul>
				<li> <a href="./fesupplyhts.jsp">Supply Halltickets</a></li>
				
			</ul>
		</li>
		
</ul>

</li>

<li><a href="#" >General</a>
<ul>
	<li> <a href="./changepass.jsp" >Change Password</a> </li>
	

</ul>
</li>


<li><a href="#" onClick=selectOption("logout")>Logout   </a>
</li>

</ul>

</nav>

<form name=optionform action="./ActionServlet" method="post">
<input type=hidden name="option"></input>
</form>		


