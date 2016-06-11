<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String thisName = null;
String parentName = null;

thisName = java.net.URLDecoder.decode((String)request.getParameter("thisName"));
parentName = java.net.URLDecoder.decode((String)request.getParameter("parentName"));

%>

<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
	<div class="container">
		<h1 class="pull-left"><%=thisName %></h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/admin/main">Home</a></li>
			<li><a href=""><%=parentName %></a></li>
			<li class="active"><%=thisName %></li>
		</ul>
	</div><!--/container-->
</div>
<!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->