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
	</head>

	<BODY>
    <div class="body-box">
		<TABLE cellSpacing=1 cellPadding=4 width="100%" border=0>
			<s:iterator value="#request.liuyanList" id="liuyan">
			    <TR>
				<TD>
					<TABLE class=tpt width="100%" border=0>
						<TBODY>
							<TR bgColor=#cccccc>
								<TD align=middle width="10%">
									<STRONG>留言人：</STRONG>
								</TD>
								<TD width="15%">
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanUser"/></FONT>
								</TD>
								<TD align=middle width="14%">
									<STRONG>留言时间：</STRONG>
								</TD>
								<TD width="29%">
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanDate"/></FONT>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a style="color: red" href="<%=path %>/liuyanDel.action?liuyanId=<s:property value="#liuyan.liuyanId"/>">删除</a>
									<a style="color: blue" href="<%=path %>/ansowerContent.action?liuyanId=<s:property value="#liuyan.liuyanId"/>">回复留言</a>
								</TD>
							</TR>
							<TR>
								<TD align=middle>
									<STRONG>标题：</STRONG>
								</TD>
								<TD colSpan=3>
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanTitle"/></FONT>
								</TD>
							</TR>
							<TR>
								<TD vAlign=top align=middle>
									<STRONG>内容：</STRONG>
								</TD>
								<TD colSpan=3>
									<s:property value="#liuyan.liuyanContent" escape="false"/>
								</TD>
							</TR>
							<TR>
								<TD vAlign=top align=middle>
									<STRONG>回复：</STRONG>
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
	</div>
	</BODY>
</html>
