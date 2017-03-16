<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        <base target="_self"/>
		<link rel="stylesheet" href="<%=path%>/css/front.css" type="text/css"></link>
		<link rel="stylesheet" href="<%=path%>/css/admin.css" type="text/css"></link>
		<link rel="stylesheet" href="<%=path%>/css/theme.css" type="text/css"></link>
		
        <style type="text/css">
	       .rpos{float:left;padding:3px 0px 3px 20px;background:url(<%=path %>/img/arrow.gif) center left no-repeat;}
        </style>
        <script language="javascript">      
        function check()
        {
                   
        	   if(document.formPw.userName.value =="")
               {
                   alert("用户名");
                   document.formPw.userName.focus();
	                   return false;
               }
             if(document.formPw.userPw.value =="")
             {
                 alert("新密码不能空");
                 document.formPw.userPw.focus();
                   return false;
             }
             if(document.formPw.userPw.value.length<6||document.formPw.userPw.value.length>18||!isNaN(document.formPw.userPw.value))
  			{
  				alert("密码必须是6~18位字母和数字组成");
  				document.formPw.userPw.focus();
  				return false;
  			}
        }
            function closeOpen()
		    {
		       window.returnValue=false;
		       window.close();
		    }
		    
        </script>
	</head>

	<body>
	        <div class="body-box">
			<form action="<%=path %>/adminAdd.action" name="formPw" method="post" onsubmit="return check()">
				     <table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
						<tr>
						    <td width="20%" class="pn-flabel pn-flabel-h">
						         用户名：
						    </td>
						    <td width="80%" class="pn-fcontent">
						        <input type="text" name="userName" size="20"/>
						    </td>
						</tr>
						<tr>
						    <td width="20%" class="pn-flabel pn-flabel-h">
						        密码：
						    </td>
						    <td width="80%" class="pn-fcontent">
						        <input type="password" name="userPw" id="userPw" size="22"/>
						    </td>
						</tr>
						<tr>
						    <td width="20%" class="pn-flabel pn-flabel-h">
						        &nbsp;
						    </td>
						    <td width="20%" class="pn-fcontent">
						       <input type="submit" value="提交"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						       <input type="button" value="取消" onclick="closeOpen()"/>
						    </td>
						</tr>
					 </table>
			</form>
			</div>
   </body>
</html>
