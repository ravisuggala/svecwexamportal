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
		           $("#branch").html("<option></option><option value='E.E.E'>E.E.E</option><option value='E.C.E'>E.C.E</option> <option value='C.S.E'>C.S.E</option> <option value='I.T'>I.T</option> <option value='MECH'>MECH</option> <option value='CIVIL'>CIVIL</option><option value='AI&DS'>AI&DS</option><option value='all'>All</option>");
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
	<li> <a href="./profileparams.jsp"> Student Profile</a></li>
	<li> <a href="./promotionparam1.jsp"> Student Promotion</a></li>
	<li> <a href="./readmitparam1.jsp"> Student ReAdmission</a></li>
	<li> <a href="./setregulation.jsp"> Set Regulation</a></li>
	<li> <a href=""> Course Completion</a>
		<ul>
		<li> <a href="./crscomplete1.jsp" > Entry</a></li>
		<li> <a href="./editcrscomplete1.jsp" >Edit</a></li>
		</ul>
	</li>
	<li> <a href="./setresultsdate.jsp">Results Declaration Date</a></li>
	<li> <a href="./intrmarksupdateparam1.jsp">Internal Marks</a></li>
	<li> <a href="#"> Delete</a>
	
	<ul>
		<li> <a href="delmids.jsp" > Mids</a></li>
		<li> <a href="delmapparams.jsp" >Map Subjects</a></li>
		<li> <a href="delstparams.jsp" >Students</a></li>
		<li> <a href="./delregistration1.jsp">Student Registration</a></li>
		
		
		</ul>
	
	
	
	</li>
	
</ul>
</li>


<li><a href="" target="_self" >Examinations</a>
<ul>
	<li> <a href="#" > Internal Examinations</a>
	<ul>
		<li><a href="#">Marks Entry</a>
		<ul>
				<li> <a href="#" onClick=selectOption("mid")>Mid Marks</a></li>
				<li> <a href="./assignmentStep1.jsp">Assignment Marks</a></li>
				<li> <a href="./LabStep1.jsp">Lab Marks</a></li>
				<li> <a href="#">Grand Test Marks</a>
					<ul>
						<li> <a href="./grandtestStep1.jsp">General Subjects</a></li>
						<li> <a href="./fegtstep1.jsp">Free Electives</a></li>
					</ul>
				
				</li>
			</ul>
		
		</li>
		<li><a href="#">Freeze Marks</a>
		<ul>
				<li> <a href="./midfreeze.jsp">Mid wise Marks</a></li>
				<li> <a href="./freezmarksparams.jsp">Final Marks</a></li>
			</ul>
		
		
		</li>
		
	</ul>
	</li>
	<li> <a href="#"> External Examinations</a>
	<ul>
	<li><a href="#" >Generate Exam Applications</a>
			<ul>
				<li> <a href="./examapplication1.jsp">Regular</a></li>
				<li> <a href="./supplyexamapplication1.jsp">Supplementary</a></li>
				<li> <a href="./fesupplyexamapplication1.jsp">Free Elective Supply</a></li>
	
			</ul>	
	</li>
		<li><a href="./examcreation.jsp" >Exam Creation</a></li>
		<li><a href="#">Student Registration</a>
			<ul>
				<li> <a href="./regularregistration1.jsp">Regular</a></li>
				<li> <a href="#">Revaluation</a>
				<ul>
						<li> <a href="./revregistration1.jsp">Regular Revaluation</a></li>
						<li> <a href="./srvregistration1.jsp">Supply Revaluation</a></li>
				
				</ul>
				
				</li>
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
		<li><a href="#">Process Results</a>	
		
				<ul>
				<li> <a href="./externalmarksparam1.jsp">General</a></li>
				<li> <a href="./externalfemarksparam1.jsp">Free Elective</a></li>
				
				<li> <a href="./resultscsvupload.jsp">Compare CGPAs</a></li>
				<li> <a href="#">FE Freeze</a>
					<ul>
					<li> <a href="./fefreezeparams1.jsp">Regular</a></li>
			    	<li> <a href="./fefreezsupply1.jsp">Supplementary</a></li>
				    </ul>
				</li>
				</ul>
		
		</li>
		<li><a href="./pgprojectsparam1.jsp">Process PG Project Grades</a>	</li>
		<li><a href="#">Delete</a>
			<ul>
				<li> <a href="./delexamregistration1.jsp">Exam Registrations</a></li>
				
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
		<li> <a href="#" onClick=selectOption("internal")> Subject wise</a></li>
		<li> <a href="#" onClick=selectOption("cmidmarks")> Consolidated Report</a></li>

		<li> <a href="./datasheetparams.jsp"> Internal Marks Data Sheet</a></li>
		<li> <a href="./internalsparams.jsp"> Examination wise Internals</a></li>
		</ul>
	</li>
	<li> <a href="#" > External Examinations</a>
		<ul>
			<li><a href="#"> Registrations</a>
			<ul>
				<li> <a href="./downloadregistration1.jsp">Regular</a></li>
				<li> <a href="#">Revaluation</a>
				<ul>
					<li> <a href="./revdownloadregistration1.jsp" > Regular Revaluation</a></li>
					<li> <a href="./revdownloadregistration1.jsp" >Supply Revaluation</a></li>
				</ul>
				
				</li>
				<li> <a href="./downloadregistration1.jsp">Supplementary</a></li>
				<li> <a href="./downloadferegistration1.jsp">Free Elective</a></li>
			</ul>
			</li>
			
			<li><a href="./hallticketsparams1.jsp"> Halltickets</a></li>
			<li> <a href="./eedownloadparams1.jsp">External Exams List</a></li>
			<li><a href="#"> Results</a>
			<ul>
			<li> <a href="webresultsparam1.jsp">Website Sheet</a>
			<li> <a href="botresultsparam1.jsp">BOT Sheet</a>
			<li> <a href="nbresultsparam1.jsp"> Notice Board Sheets</a>
			<li> <a href="#"> Aggregate Results</a>
			<ul>
				<li> <a href="./externalaggregateparam1.jsp">Examination Wise</a></li>
				<li> <a href="./batchresultsparam1.jsp">Batch Wise</a></li>
				<li> <a href="#"> Failure List</a>
				<ul>
					<li> <a href="./failedlistparam1.jsp">Student wise List</a></li>
					<li> <a href="./failedsubsparam1.jsp">Subject wise Failures</a></li>
					<li> <a href="./failurecgpaparam1.jsp">CGPAs for Failures</a></li>
				</ul>
				</li>
				<li> <a href="./resultanalysisparams.jsp">Result Analysis</a></li>
			</ul>
		    
			
			</li>
			<li> <a href="#"> Marks Memo Data Sheet</a>
			
			<ul>
				<li> <a href="./exammarksmemoparam1.jsp">Examination Wise</a></li>
				<li> <a href="./marksmemoparam1.jsp">Batch Wise</a></li>
				
			</ul>
		    </li>
			<li><a href="#">  Consolidated Grade Report</a>
			<ul>
				<li> <a href="./regdinput.jsp">Student Wise</a></li>
				<li> <a href="./gradesheetparam1.jsp">Semester Wise</a></li>
				<li> <a href="./ecapsheetparam1.jsp">ECAP Data Sheet</a></li>
			</ul>
		    </li>
			<li> <a href="./cmmparam1.jsp"> CMM Data Sheet</a></li>
			<li>  <a href="./totmarksparam1.jsp"> Obtained Total Marks Sheet</a></li>
			<li>  <a href="./smssheetparam1.jsp"> SMS Data Sheet</a></li>
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
				<li> <a href="./semwisemarksparam1.jsp" >Sem wise Marks Report</a></li>
				
			</ul>
			</li>
			</ul>
		</li>
	
		<li> <a href="#"> JNTU Sheets</a>
			<ul>
				<li> <a href="#">For PCs</a>
				<ul>
						<li> <a href="./jntuugparam1.jsp">UG</a></li>
						<li> <a href="./jntupgparam1.jsp">PG</a></li>
				</ul>
				</li>
				<li> <a href="./jntuexamsparam1.jsp">For Exams</a></li>
				<li> <a href="./jntubatchparam1.jsp">For Batchwise</a></li>
				<li> <a href="./jntutotalparam1.jsp">Total Results</a></li>
				<li> <a href="./jntustparam1.jsp">For Student</a></li>
				<li> <a href="./jntuschparam1.jsp">For Scholarships</a></li>
				<li> <a href="./jntumappingsparam1.jsp">Subject Mappings</a></li>
				<li> <a href="./downloadJNTUstlist.jsp">Student list</a></li>
				
			</ul>
		
		</li>
		<li> <a href="./downloadsubjectsparam1.jsp"> Subjects</a></li>
		<li> <a href="#"> Exam Fee Portal Sheet</a>
			<ul>
				<li> <a href="./downloadregfeesheet1.jsp">Regular</a></li>
				<li> <a href="./downloadfeesheet1.jsp">Supplementary</a></li>
				<li> <a href="./downloadrevfeesheet1.jsp">Regular Revaluation</a></li>
				<li> <a href="./downloadsprevfeesheet1.jsp">Supply Revaluation</a></li>
				
			</ul>
		
		
		</li>
		
		<li> <a href="#"> Free Elective</a>
			<ul>
				<li> <a href="./fesupplyhts.jsp">Supply Halltickets</a></li>
				<li> <a href="./feexamsparam1.jsp">FE Exam details</a></li>
				
			</ul>
		</li>
		
</ul>

</li>

<li><a href="#" >General</a>
<ul>
	<li> <a href="./changepass.jsp" >Change Password</a> </li>
	<li> <a href="./createuser.jsp" >User Creation</a> </li>
	<li> <a href="#"> Data Recovery</a>
			<ul>
				<li> <a href="./backupprogress.jsp" >BackUp</a> </li>
				<li> <a href="#" >Restore</a> 
				<ul>
					<li> <a href="./restoreprogress.jsp" >From DB</a> </li>
					<li> <a href="./sqlfileparam.jsp" >From File</a> </li>
				</ul>
				
				</li>
				
			</ul>
	</li>
	
</ul>
</li>


<li><a href="#" onClick=selectOption("logout")>Logout   </a>
</li>

</ul>

</nav>

<form name=optionform action="./ActionServlet" method="post">
<input type=hidden name="option"></input>
</form>		


