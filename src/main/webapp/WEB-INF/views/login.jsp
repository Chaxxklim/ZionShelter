<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring Boot Application with JSP</title></head>
<body>
<div class="login-container">
    <table class="login-table">
        <form:form name="login-form" method="post" action="loginPost" modelAttribute="memberVO">
            <tr>
                <td><label for="id-input">ID</label></td><td><form:input id="id-input" type="text" name="id" path="memberId"/></td>
            </tr>
            <tr>
                <td><label for="pw-input">PW</label></td><td><form:input id="pw-input" type="password" name="password" path="memberPassword"/></td>
            </tr>
            <tr>
                <td colspan="2"><form:button type="submit">로그인</form:button></td>
            </tr>
        </form:form>
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

    .login-container{

    }

    .login-table{
        width: 50%;
        height: 50%;

    }
</style>
</html>

