<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
            function closeOpen()
		    {
		       window.returnValue=false;
		       window.close();
		    }
		    function check()
		    {
		    	if(newsTitle(document.formAdd.newsTitle.value)){
	         alert("您输入的标题字数太多或者是为空");
              document.formAdd.newsTitle.focus();           
		    }
		    }
		    
		    
		    
		    function newsTitle(title) 
          	{
		    	if(Content.length>200||Content==""){            
                return false;
		    }else{
		    	return true;
		    }
         	}
		    
        </script>
	</head>

	<body> 
	    <div class="body-box">
			<form action="<%=path %>/newsAdd.action" name="formAdd" method="post" onsubmit="return check()">
				     <table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
						<tr>
						    <td width="20%" class="pn-flabel pn-flabel-h">
						         标题：
						    </td>
						    <td width="80%" class="pn-fcontent">
						        <input type="text" name="newsTitle" size="100"/>
						    </td>
						</tr>
						<tr>
						    <td width="20%" class="pn-flabel pn-flabel-h">
						         内容：
						    </td>
						    
						    <td width="80%" class="pn-fcontent">
						        <FCK:editor instanceName="newsContent"  basePath="/fckeditor" width="800" height="300"  toolbarSet="Basic"></FCK:editor>
						    </td>
						    
						    
						    
						     <!-- <td width="80%" class="pn-fcontent"><textarea name="newsContent" cols="100" wrap="VIRTUAL" rows="5" ></textarea></td> -->
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
