
<%@ page import = "java.util.*,dao.*" %>

<jsp:useBean id = "miscUtil" scope="session" class="dao.FBSMiscUtilitiesBean" />
<jsp:useBean id = "fetchData" scope="session" class="dao.FBSFetchDataBean" />

<%
String degree=miscUtil.noNull(request.getParameter("degree"));
if(degree.equals(""))
	degree=miscUtil.noNull(session.getValue(("degree")));
String branch=miscUtil.noNull(request.getParameter("branch"));
if(branch.equals(""))
	branch=miscUtil.noNull(session.getValue(("branch")));


String reg=miscUtil.noNull(request.getParameter("reg"));
if(reg.equals(""))
	reg=miscUtil.noNull(session.getValue(("reg")));

String selele=new String();
selele=request.getParameter("selele");

ArrayList felist=new SubjectDB().getFESubjects(degree, branch, reg, selele);


%>
                          <% 
							out.println("<option value='' selected></option>");
							
							for(int i=0;i<felist.size();i++)
							{
								Subject sub=(Subject)felist.get(i);
							    String code=sub.getCode();
						   		String name=sub.getSname();
								out.println("<option value='"+code+"'>"+name+"</option>");
							}
							
							%>
							
							
