<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="app.domain.BoardVo"%>
<%
BoardVo bv = (BoardVo) request.getAttribute("bv");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
body {
	background: #f6f4f3;
	text-align: center;
	margin: 0;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #5b5b5b;
	padding: 8px 12px;
}

#menubar ul {
	margin: 0;
	padding: 0;
	width: 100%;
}

#menubar ul li {
	display: inline-block;
	list-style-type: none;
	padding: 0px 15px;
}

#menubar ul li a {
	color: white;
	text-decoration: none;
}

#menubar ul li a:hover {
	color: yellow;
	text-decoration: none;
}

div {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid black;
}

table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
}

th {
	border: 5px solid #f6f4f3;
	height: 20px;
	text-align: center;
}

th #name_title {
	border-style: hidden;
	width: 60px;
	height: 40px;
	display: table-cell;
	vertical-align: middle;
}

th #name_contents {
	border-style: hidden;
	width: 60px;
	height: 300px;
	display: table-cell;
	vertical-align: middle;
}

td {
	padding: 10px 10px 10px 10px;
	text-align: left;
}

td #title {
	background: white;
	border-radius: 5px;
	border-style: hidden;
	width: 300px;
	height: 40px;
	display: table-cell;
	vertical-align: middle;
	padding-left: 5px;
}

td #contents {
	background: white;
	border-radius: 5px;
	border-style: hidden;
	width: 500px;
	height: 300px;
	padding-left: 5px;
	padding-top: 5px;
}

td #userName {
	background: white;
	border-radius: 5px;
	border-style: hidden;
	width: 100px;
	height: 40px;
	display: table-cell;
	vertical-align: middle;
	padding-left: 5px;
}

#ccontents th {
	background: #5b5b5b;
	color: white;
}

#ccontents table {
	border-collapse: separate;
	border-spacing: 0;
}
</style>
</head>
<body>
	<nav id="menubar">
		<ul>
			<li><a href="../member/memberList.do">회원목록</a></li>
			<li><a href="boardList.do">게시글 목록</a></li>
			<li><a href="board/boardWrite.do">게시글 쓰기</a></li>
			<li><a href="../member/memberLogin.do">로그인</a></li>
			<li><a href="../member/memberJoin.do">회원가입</a></li>
		</ul>
	</nav>

	<h3>게시글</h3>
	<hr>
	<div id="contents">
		<table>
			<tr>
				<th><div id="name_title">제목</div></th>
				<td><div id="title"><%=bv.getSubject()%></div></td>
				<th>조회수</th>
				<td><%=bv.getViewcnt()%></td>
			</tr>
			<tr>
				<th><div id="name_contents">내용</div></th>
				<td colspan=3 height="300px" style="vertical-align: top;"><div
						id="contents"><%=bv.getContents()%>
					</div></td>
			</tr>
			<tr>
				<th><div id="name_title">작성자</div></th>
				<td><div id="userName"><%=bv.getWriter()%></div></td>
			</tr>
		</table>
		<th></th>
		<td style="text-align: right;">
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/board/boardModify.do?bidx=<%=bv.getBidx()%>'">수정</button>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/board/boardDelete.do?bidx=<%=bv.getBidx()%>'">삭제</button>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/board/boardReply.do?bidx=<%=bv.getBidx()%>&originbidx=<%=bv.getOriginbidx()%>&depth=<%=bv.getDepth()%>&level_=<%=bv.getLevel_()%>'">답글</button>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">목록</button>
		</td> <br>
		<br>
	</div>
	<div>
		<table style="width: 600px;">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="cwriter" size="20"></td>
				<td rowspan=2><input type="button" name="btn" value="저장"
					onclick="check();"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="ccontents" cols="50" rows="3"
						placeholder="내용을 입력하세요"></textarea></td>
			</tr>
		</table>
		<hr>
		<table id="ccontents">
			<tr>
				<th width=50>번호</th>
				<th width=100>작성자</th>
				<th width=200>내용</th>
				<th width=100>입력일</th>
			</tr>
			<tr>
				<td>1</td>
				<td>홍길동</td>
				<td>반갑습니다</td>
				<td>2023-09-25</td>
			</tr>
			<tr>
				<td>2</td>
				<td>이순신</td>
				<td>ㅎㅇㅎㅇ</td>
				<td>2023-09-25</td>
			</tr>
			<tr>
				<td>3</td>
				<td>가나다</td>
				<td>ㅋㅋㅋㅋㅋㅋㅋㅋ</td>
				<td>2023-09-25</td>
			</tr>
		</table>
	</div>
</body>
</html>
