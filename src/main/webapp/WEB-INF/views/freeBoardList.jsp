<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring Boot Application with JSP</title></head>
<body>
<div class="board-container">
    <table class="boardList-table">
        <c:forEach items="${boardVOList}" var="boardVO">
            <tr>
                <td>글번호</td><td>${boardVO.getBoardIdx()}</td>
                <td>글쓴이</td><td>${boardVO.getMemberName()}</td>
                <td>제목</td><td><a href="/freeBoardDetail?boardIdx=${boardVO.getBoardIdx()}">${boardVO.getBoardTitle()}</a></td>
                <td>작성일시</td><td>${boardVO.getBoardWriteDate()}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
<style>
    body{
        height: 80vh;
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }



    .boardList-table{
        width: 100%;
        height: 100%;
        border: 1px solid black;
    }
</style>
</html>

