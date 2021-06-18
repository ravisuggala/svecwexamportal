
<%@ page import = "java.util.*,dao.*" %>
<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />
<jsp:useBean id = "subdb" scope="session" class="dao.SubjectDB" />
<jsp:useBean id = "stdb" scope="session" class="dao.StudentDB" />

<%
String degree=miscUtil.noNull(request.getParameter("degree"));
if(degree.equals(""))
	degree=miscUtil.noNull(session.getValue(("degree")));
String branch=miscUtil.noNull(request.getParameter("branch"));
if(branch.equals(""))
	branch=miscUtil.noNull(session.getValue(("branch")));

String sem=miscUtil.noNull(request.getParameter("sem"));
if(sem.equals(""))
	sem=miscUtil.noNull(session.getValue(("sem")));

String reg=miscUtil.noNull(request.getParameter("reg"));
if(reg.equals(""))
	reg=miscUtil.noNull(session.getValue(("reg")));

HashMap electivelist=new HashMap();
electivelist=subdb.getElectiveList(degree, branch, sem, reg);
session.putValue("electives", electivelist);

%>

								<option value="" selected>-</option>
								<%
									   Set<String> keys=electivelist.keySet();
										for(String key:keys)
										{
								%>
										<option value='<%=key %>'><%=key %> </option>
								<%
											
								} 
										
									%>
	
