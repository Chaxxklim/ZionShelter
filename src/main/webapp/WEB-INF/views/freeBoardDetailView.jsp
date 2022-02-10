<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <table class="board-table">
        <tr>
            <td>제목</td><td>${boardVO.boardTitle}</td>
        </tr>
        <tr>
            <td>글쓴이</td><td>${boardVO.memberName}</td>
        </tr>
        <tr>
            <td>내용</td><td>${boardVO.boardContent}</td>
        </tr>
        <tr>
            <td>작성일</td><td>${boardVO.boardWriteDate}</td>
        </tr>
    </table>

    <table class="comment-table">
        <c:forEach items="${commentVOList}" var="commentVO">
        <tr>
            <td>${commentVO.memberName}</td><td>${commentVO.commentContent}</td><td>${commentVO.commentDate}</td>
        </tr>
        </c:forEach>
        <tr>
            <form:form name="commentForm" method="post" action="commentPost" modelAttribute="commentVO">
                <td><form:textarea placeholder="댓글 작성" path="commentContent" name="commentContent"/></td><td><button type="submit">작성</button></td>
                <form:input id="" value="${boardVO.boardIdx}" path="boardIdx" readonly="true"/>
            </form:form>
        </tr>
    </table>
</body>
<style>
    .board-table{
        border: 1px solid black;
    }
</style>
</html>