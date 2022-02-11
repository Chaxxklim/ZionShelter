<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <table class="board-table" id="board-table">
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
<%--        여기에다가 이제 이미지 넣는거 해야함--%>
    </table>

    <table class="comment-table" id="comment-table">
        <c:forEach items="${commentVOList}" var="commentVO">
        <tr>
            <td>${commentVO.memberName}</td><td>${commentVO.commentContent}</td><td>${commentVO.commentDate}</td>
        </tr>
        </c:forEach>
        <tr>
            <td><textarea id="commentContent"></textarea></td>
            <td><button type="button" onclick="postComment()">작성</button></td>
        </tr>
    </table>
</body>
<style>
    .board-table{
        border: 1px solid black;
    }
</style>
<script>
    function postComment(){
        let commentContent = document.getElementById('commentContent').value;
        let boardIdx = '${boardVO.boardIdx}';
        console.log(boardIdx)
        console.log(commentContent)
        $.ajax({
            url : '/commentPost',
            method : 'POST',
            data : JSON.stringify({
                'commentContent' : commentContent,
                'boardIdx' : boardIdx,
                'memberIdx' : '1' //균창아 여기 세션으로 넣어야해.
            }),
            dataType : 'json',
            contentType : 'application/json',
            success : function(data){
                console.log(data.insertCommentVO.commentContent)
                const commentTable = document.getElementById('comment-table');
                var row = commentTable.insertRow(0);
                var nameCell = row.insertCell(0);
                var contentCell = row.insertCell(1);
                var dateCell = row.insertCell(2);
                nameCell.innerHTML = data.insertCommentVO.memberName;
                contentCell.innerHTML = data.insertCommentVO.commentContent;
                dateCell.innerHTML = data.insertCommentVO.commentDate;
            }
        })
    }
</script>
</html>