<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>register</title></head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
<div class="register-container">
    <table class="register-table">
        <form:form name="register-form" method="post" action="registerPost">
            <tr>
                <td><label for="id-input">ID</label></td><td><input id="id-input" type="text" name="id" onkeyup="idCheck()"></td><td class="id-check-td" id="id-check-td">testText</td>
            </tr>
            <tr>
                <td><label for="pw-input">비밀번호</label></td><td><input id="pw-input" type="password" name="password"></td>
            </tr>
            <tr>
                <td><label for="pw-check-input">비밀번호 확인</label><input id="pw-check-input" type="password" name="password-check"></td><td class="pw-check-td" id="pw-check-td">testText</td>
            </tr>
            <tr>
                <td><label for="name-input">이름</label><input id="name-input" type="text" name="name"></td>
            </tr>
            <tr>
                <td><label for="phone-input">전화번호</label><input id="phone-input" type="text" name="phone"></td>
            </tr>
            <tr>
                <td><label for="zipcode-input">우편번호</label><input id="zipcode-input" type="text" name="zipcode"></td>
            </tr>
            <tr>
                <td><label for="addr1-input">주소</label><input id="addr1-input" type="text" name="addr1"></td>
            </tr>
            <tr>
                <td><label for="addr2-input">상세주소</label><input id="addr2-input" type="text" name="addr2"></td>
<%--                zipcode api --%>
            </tr>
<%--            <tr>--%>
<%--                <td colspan="2"><button type="submit">가입</button></td>--%>
<%--            </tr>--%>
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

    .register-container{

    }

    .register-table{
        width: 80%;
        height: 80%;

    }

    .id-check-td{
        display: none;
    }

    .pw-check-td{
        display: none;
    }

</style>
<script>
    function idCheck(){
        const inputId = document.getElementById('id-input').value;
        console.log(inputId)

        $.ajax({
                url : "/idCheckPost",
                method : "POST",
                data : JSON.stringify({
                    "inputId" : inputId
                }),
                dataType : "json",
                contentType : 'application/json',
                success : function (res){
                    if(res === 'Y'){
                        console.log("ajax Y")
                        // showGreenDiv();
                    }else{
                        // showRedDiv();
                    }
                }
            })
    }

    function showGreenIdDiv(res){
        if(document.getElementById('id-check-td').style.display === 'none'){
            document.getElementById('id-check-td').style.display = 'block';
            document.getElementById('id-check-td').style.color = '#0EEF03';
        }

    }

    function showRedIdDiv(res){
        document.getElementById('id-check-td').style.display = 'block';
    }

    function showGreenPwDiv(){
        document.getElementById('id-check-td').style.display = 'block';
    }

    function showRedPwDiv(){
        document.getElementById('id-check-td').style.display = 'block';
    }

</script>
</html>

