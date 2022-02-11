<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>boardWrite</title></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
<div class="write-container">
    <table class="write-table">
        <form:form action="boardWritePost" method="post" modelAttribute="boardVO" enctype="multipart/form-data">
            <form:input path="memberIdx" value="1"></form:input>
            <%--            여기 세션에서 받은 값으로 낼 바꾸장 오늘은 귀찮다 ^^ ㅎㅎ--%>
<%--            <form:input path="memberIdx" value="memberIdx"></form:input>--%>
            <tr>
                <td>카테고리</td>
                <td>
                    <form:select path="boardDivision">
                        <form:option value="F">자유</form:option>
                        <form:option value="C">회의</form:option>
                        <form:option value="N">공지</form:option>
                    </form:select>
                </td>
                <td>제목</td>
                <td><form:input type="text" path="boardTitle" name="boardTitle"/></td>
                <td>내용</td>
                <td><form:input type="text" path="boardContent" name="boardContent"/></td>
                <td>dd</td><td><form:input path="file" id="file" name="file" type="file"/></td>
                <td><form:button type="submit">전송~</form:button></td>
            </tr>
        </form:form>

    </table>

</div>

</body>
<style>
    body {
        height: 80vh;
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }

    .register-container {

    }

    .register-table {
        width: 80%;
        height: 80%;

    }

    .id-check-td {
        display: none;
        white-space: nowrap;
    }

    .pw-check-td {
        display: none;
        white-space: nowrap;
    }

</style>

</html>

