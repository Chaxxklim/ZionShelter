<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ZionShelter</title></head>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" hrㅠㅐef="/resources/css/common.css">
<body>
<div class="main-container">
    <div class="top-navbar">
        <ul class="top-navbar-ul">
            <li class="top-navbar-li"><div class="navbar-li-item-div"><a href="/" ><img class="logo-img" src="/resources/images/logo.png" alt=""></a></div></li>
            <li class="top-navbar-li"><div class="navbar-li-item-div"><a href="/noticeBoardList" >알립니다</a></div></li>
            <li class="top-navbar-li"><div class="navbar-li-item-div"><a href="/freeBoardList" >Freeboard</a></div></li>
            <li class="top-navbar-li"><div class="navbar-li-item-div"><a href="/dogBoardList" >DogList</a></div></li>
            <li class="top-navbar-li"><div class="navbar-li-item-div"><a href="/contact" >About us</a></div></li>
        </ul>
    </div>
    <div class="board-container">
        <table class="boardList-table">
            <tr>
                <th>글번호</th>
                <th>글쓴이</th>
                <th>제목</th>
                <th>작성일시</th>
            </tr>
<%--            <c:forEach items="${boardVOList}" var="boardVO">--%>
<%--                <tr>--%>
<%--                    <td>${boardVO.getBoardIdx()}</td>--%>
<%--                    <td>${boardVO.getMemberName()}</td>--%>
<%--                    <td><a href="/freeBoardDetail?boardIdx=${boardVO.getBoardIdx()}">${boardVO.getBoardTitle()}</a></td>--%>
<%--                    <td>${boardVO.getBoardWriteDate()}</td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
            <c:forEach   begin="1" end="10" step="1">
            <tr>
                <td>11</td>
                <td>균창임</td>
                <td>테스트제목임니다~~</td>
                <td>2022-02-13</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</div>


</body>
<style>
    .main-container{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }

    .top-navbar{
        width: 100%;
        height: calc(100% - 720px);
    }

    .top-navbar-ul{
        display: flex;
        justify-content: space-around;
        background: black;
    }

    .navbar-li-item-div{
        width: 120px;
        height: 40px;
        background: pink;
        border-radius: 5px ;
    }

    .logo-img{
        width: 120px;
        height: 40px;
    }

    .board-container{
        width: 100%;
        height: 100%;
        display: flex;
        border: 1px solid red;
        justify-content: center;
    }

    .boardList-table{
        width: 90%;
        height: 90%;
        color: black;
        border: 1px;
        border-radius: 10px;
        overflow: scroll;
        text-align: center;

    }

    .boardList-table th, td{
        /*border: 1px solid black;*/
        border: 3px;
        border-style: solid;
        color: black;
    }

    .boardList-table th{
        height: 25px;
        padding: 10px 10px;
    }

    .boardList-table td{
        padding: 20px 15px;
    }

</style>
</html>

