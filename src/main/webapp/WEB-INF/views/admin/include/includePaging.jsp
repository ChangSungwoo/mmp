<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	String htmlFormId = (String)request.getParameter("formId");
	if( htmlFormId == null )	htmlFormId = "";
	htmlFormId = htmlFormId.trim();	
	if( htmlFormId.equals("") )	htmlFormId = "frm";
%>

<div class="text-left">
	<ul class="pagination">
		<li><a href="javascript:goPageNo(1);">«</a></li>
		<c:choose>
			<c:when test="${totalPage > 0}">
				<c:forEach var="i" begin="1" end="${totalPage}" step="1" varStatus ="status">
					<li <c:if test="${pageNo eq i }"> class="active" </c:if>><a href="javascript:goPageNo(${i});">${i}</a></li>
				</c:forEach>
			</c:when>
		</c:choose>
		<li><a href="javascript:goPageNo(${totalPage});">»</a></li>
	</ul>
</div>

<script>

//페이징 번호로 이동
function goPageNo(i){
	$('#pageNo').val(i);
	$('#pagingFrm').submit();
	//location.href = "/admin/movie/movieList?pageNo="+i;
}
</script>