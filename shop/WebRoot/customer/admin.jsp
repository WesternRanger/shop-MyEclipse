<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<jsp:directive.page import="dao.Result"/>
<jsp:useBean id="obj" class="dao.Result"></jsp:useBean>
<%
  response.setContentType("text/html;charset=UTF-8");
   request.setCharacterEncoding("UTF-8");
//("jdbc:mysql://localhost:3306/shujuku?user=root&password=root&useUnicode=true&characterEncoding=GB2312")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>京东商城</title>
	 <style>
span a:hover{text-decoration:underline;color:red;}
body{
	margin:0px;
	padding:0px;
}
p{
	padding:0px;
	margin:20px;
	width:100%;
	height:40px;
	line-height:40px;
	vertical-align:middle;
	text-align:center;
	font-family:"黑体";
	font-weight:bold;
	color:gray;
	font-size:40px;
}
	#aa{
	height:30px;
	width:1050px;
	float:left;
	}
#aa span{
	text-align:center;
	vertical-align:middle;
	line-height:30px;
	color:blue;
	font-size:20px;
	font-family:"黑体";
	font-weight:bold;
	height:30px;
	width:100px;
	float:left;
	}
#aa1{
	height:30px;
	width:1050px;
	margin-left:-2px;	
	float:left;
	}
#aa1 #big,#aa #big{
	width:200px;
	height:30px;
	float:left;
	text-align:center;
	vertical-align:middle;
	line-height:30px;
	font-size:19px;
}
#aa1 span{
	text-align:center;
	vertical-align:middle;
	line-height:30px;
	font-size:19px;
	height:30px;
	width:100px;
	float:left;
	}
#but>input{
	width:80px;
	height:25px;
	border-radius:7px;
}
#but span input{
	width:50px;
	color:darkgray;
}
#aa1 span #first{
	width:50px;
	height:20px;
	}     
#content{
	margin:auto;
	width:800px;
}
</style>
</head>
<body bgcolor="#f2f2f2">
	<span style="width:800px;margin:auto;font-size:13px;color:darkgray;display:block;margin-top:10px;"> 
		<%out.println("管理员--"+session.getAttribute("mark")+"--您好，沏杯茶吧，保持旺盛的工作精力");%>
		<a href="login.jsp" style="float:right;text-decoration:none;">退出</a>
	</span>
	<p>商场超级管理员工作区</p>
    
	<%
		String jspflag=request.getParameter("flag");
		if("del".equals(jspflag)){
			Result.admindelteform(request);
		}
		if("ins".equals(jspflag)){
			Result.admininsertform(request);
		}
	 %>
 <form id="content" action="admin.jsp" name="excel">
 	<span id="but">
 		<span style="font-size:14px;color:red; margin-left:10px;">请按照文本框内的提示输入要发布商品的信息！！！</span>
 		<span>
 			<input name="pid" value="编号">
 			<input name="pname" value="名称">
 			<input name="pprice" value="售价">
 			<input name="pmount"value="库存">
 			<input name="pseller" value="运费">
 			<input name="mailcost" value="配件">
 		</span>
 		<input type="button" value="确认发布" onclick="insmeth()"/>
 		<script type="text/javascript">
 			function insmeth(){
			document.excel.flag.value="ins";
			document.excel.submit();
		}
 		</script>
    	<br>
    	<br>
		<span style="font-size:14px;color:red; margin-left:40px;">请在要下架的商品前打对勾！！！</span><input type="button" value="确认下架" onclick="delmeth()"/>
		<input type="hidden" value="" name="flag"/>
	 </span>
	<script type="text/javascript">
		function delmeth(){
			document.excel.flag.value="del";
			document.excel.submit();
		}
	</script>
  		<div class="form">
	<div id="aa">
				<span>选择下架</span>
				<span>编号</span> 
				<span id="big">名称</span> 
				<span>售价</span> 
				<span>库存</span> 
				<span>运费</span> 
				<span>配件</span>
	</div>


<%
 response.setContentType("text/html;charset=UTF-8");
   request.setCharacterEncoding("UTF-8");
ResultSet rs=obj.getModify(request);
System.out.println("rs===" + rs);
ResultSetMetaData rsmd=rs.getMetaData();
int colcount = rsmd.getColumnCount();
while(rs.next())
{%>
	<div id="aa1">
	 
			<span><input type="checkbox" name="pid" value="<%=rs.getString(1) %>" id="first"></span>
			<%for(int j=1;j<=colcount;j++)
			{
				if(j==2){
					%><span id="big">
				<%out.println(rs.getString(2));%>
			</span>
			<%}
			else{
			%><span id="modi">
				<%out.println(rs.getString(j));%>
			</span>
			<%}}%>
			
			
		</div>
	
<%}%>
	</div>
</form>
</body>
</html>