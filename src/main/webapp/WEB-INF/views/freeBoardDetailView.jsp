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
</body>
<style>
    .board-table{
        border: 1px solid black;
    }
</style>
</html>