<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
</head>
<body>

	<div class="container">

		<div class="header">
			<h1>Qna 페이지</h1>

			<a href="/writeQna" class="btn btn-outline-warning">게시글 등록</a>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>질문번호</th>
					<th>제목</th>
					<th>아이디</th>
					<th>작성일</th>
					<th>답변상태</th>

				</tr>
			</thead>
			<tbody>
				<!--  현재 주소에 있는 거 긁어서 같이 넘기고,거기서 계속 넘기면 다시 유지해서 올 수 있음 -->
				<c:forEach items="${list}" var="item" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<!-- 
						<td><a href="/qna/view?qna_num=${item.qnaNum}">${item.title}</td>
						 -->
						 <td><a href="/viewQna?qnaNum=${item.qnaNum}">${item.title}</a></td>
						<td>${item.id}</td>
						<td><fmt:formatDate value="${item.writeDate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${item.status}</td>		
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<nav>
			<ul class="pagination">
				<li class="page-item ${paging.prev ? '' : 'disabled'}"><a class="page-link" href="/listQna?page=${paging.startPage - 1}">Previous</a>
				</li>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
					<li class="page-item"><a class="page-link ${paging.page== page ? 'active' : ''} " href="/listQna?page=${page}">${page}</a></li>		
				</c:forEach>
			
				<li class="page-item ${paging.next ? '' : 'disabled'}"><a class="page-link" href="/listQna?page=${paging.endPage + 1}">Next</a></li>
			</ul>
		</nav>
</body>
</html>