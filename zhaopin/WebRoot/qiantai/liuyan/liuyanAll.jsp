<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link>
		<link rel="stylesheet" href="<%=path%>/css/front.css" type="text/css"></link>
		<link rel="stylesheet" href="<%=path%>/css/admin.css" type="text/css"></link>
		<link rel="stylesheet" href="<%=path%>/css/theme.css" type="text/css"></link>
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>	
		<script type="text/javascript" src="<%=path%>/js/pony.js"></script>
		<script type="text/javascript" src="<%=path%>/js/front.js"></script>
		<script type="text/javascript" src="<%=path%>/js/admin.js"></script>
		

		<style type="text/css">
	       .lbody{background:url(<%=path%>/img/lbg.jpg) right repeat-y #F4F7FB;color:#666666;margin-right:6px;}
	       .lmenu a{display:block;padding:7px 0px 7px 30px;; background:url(<%=path%>/img/circle.gif) no-repeat 15px -1px;}
	       .rpos{float:left;padding:3px 0px 3px 20px;background:url(<%=path%>/img/arrow.gif) center left no-repeat;}
	       .pn-lthead th{height:27px;background-image:url(<%=path%>/img/msg_bg.jpg);}
        </style>
        
         <script language="javascript">
        <%--  function checkLogin()
     	{
     	  <s:if test="#session.user==null">
           alert("请先登录");
           window.top.location.href="<%=path %>/index.action" ;
         
       </s:if>
       --%>
       
     	}
        </script>
	</head>

	<BODY>
    <div class="body-box" >
		<TABLE cellSpacing=1 cellPadding=4 width="100%" border=0>
			<s:iterator value="#request.liuyanList" id="liuyan">
			    <TR>
				<TD>
					<TABLE class=tpt width="100%" border=0>
						<TBODY>
							<TR bgColor=#cccccc>
								<TD align=left width="5%">
									<STRONG>留言人：</STRONG>
								</TD>
								<TD width="15%">
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanUser"/></FONT>
								</TD>
								<TD align=left width="5%">
									<STRONG>留言时间：</STRONG>
								</TD>
								<TD width="29%">
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanDate"/></FONT>
								</TD>
							</TR>
							<TR>
								<TD align=left>
									<STRONG>标题：</STRONG>
								</TD>
								<TD colSpan=3>
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanTitle"/></FONT>
								</TD>
							</TR>
							<TR>
								<TD vAlign=top align=left>
									<STRONG>内容：</STRONG>
								</TD>
								<TD colSpan=3>
									<s:property value="#liuyan.liuyanContent" escape="false"/>
								</TD>
							</TR>
							
							<TR>
								<TD vAlign=top align=left>
									<STRONG>管理员回复：</STRONG>
								</TD>
								<TD colSpan=3>
									<s:property value="#liuyan.liuyan_ansowerContent" escape="false"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			</s:iterator>
		</TABLE>
		<BR>
		<form action="<%=path %>/liuyanAdd.action" method="post" onclick="return checkLogin()">
		<table border="0">
		     <tr>
		         <td style="font-size: 11px;">标题</td>
		         <td><input type="text" name="liuyanTitle" size="50"/></td>
		     </tr>
		     <tr>
		         <td style="font-size: 11px;">内容</td>
		         <td>
		              <FCK:editor instanceName="liuyanContent"  basePath="/fckeditor" width="500" height="200"  toolbarSet="Basic">
                      </FCK:editor>
                 </td>
		     </tr>
		     <tr>
		         <td style="font-size: 11px;">&nbsp;</td>
		         <td>
		             <input type="submit" name="" value="提交留言">
                 </td>
		     </tr>
		</table>
		</form>
	</div>
	</BODY>
</html>
