<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>register</title></head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
<div class="register-container">
    <table class="register-table">
        <form:form name="registerForm" method="post" action="registerPost" modelAttribute="memberVO">
            <tr>
                <td><label for="id-input">ID</label></td><td><form:input id="id-input" type="text" name="memberId" onkeyup="idCheck()" path="memberId"/></td>
                <td class="id-check-td" id="id-check-td">None</td>
            </tr>
            <tr>
                <td><label for="pw-input">비밀번호</label></td><td><form:input id="pw-input" type="password" name="memberPassword" path="memberPassword" /></td>
            </tr>
            <tr>
                <td><label for="pw-check-input">비밀번호 확인</label><input id="pw-check-input" type="password" name="password-check" onkeyup="pwCheck()"></td>
                <td class="pw-check-td" id="pw-check-td">testText</td>
            </tr>
            <tr>
                <td><label for="name-input">이름</label><form:input id="name-input" type="text" name="memberName"  path="memberName"/></td>
            </tr>
            <tr>
                <td><label for="phone-input">전화번호</label><form:input id="phone-input" type="text" name="memberPhoneNumber" path="memberPhoneNumber"/></td>
            </tr>
            <tr>
                <td><label for="zipcode-input">우편번호</label><form:input id="zipcode-input" type="text" name="memberZipcode" path="memberZipcode" onclick="inputZipcode()"/></td>
            </tr>
            <tr>
                <td><label for="addr1-input">주소</label><form:input id="addr1-input" type="text" name="memberAddress1" path="memberAddress1" onclick="inputZipcode()"/></td>
            </tr>
            <tr>
                <td><label for="addr2-input">상세주소</label><form:input id="addr2-input" type="text" name="memberAddress2" path="memberAddress2"/></td>
<%--                zipcode api --%>
            </tr>
            <tr>
                <td colspan="2"><button type="button" onclick="beforeSubmit()">가입</button></td>
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

    .register-container{

    }

    .register-table{
        width: 80%;
        height: 80%;

    }

    .id-check-td{
        display: none;
        white-space:nowrap;
    }

    .pw-check-td{
        display: none;
        white-space:nowrap;
    }

</style>
<script>
    let idExp = /^[A-Za-z0-9]{6,20}$/
    let pwExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
    let nameExp = /^[가-힣]{2,10}$/;
    let phoneExp = /^[0-9]+$/
    function idCheck(){
        let inputId = document.getElementById('id-input').value;
        if(inputId === '' || inputId.length < 6  || !idExp.test(inputId)){
            $('#id-check-td').css('display', 'block');
            $('#id-check-td').css('color', 'red');
            $('#id-check-td').text('사용 불가능');
            return false;
        } else{
            $.ajax({
                url : "/idCheckPost",
                method : "POST",
                data : JSON.stringify({
                    "inputId" : inputId
                }),
                dataType : "json",
                contentType : 'application/json',
                success : function (data){
                    $('#id-check-td').css('display', 'block');
                    if(data.result === 'Y') {
                        $('#id-check-td').css('color', 'green');
                        $('#id-check-td').text('사용 가능');
                    } else {
                        $('#id-check-td').css('color', 'red');
                        $('#id-check-td').text('사용 불가능');
                        return false;
                    }
                }
            })
        }
    }

    function pwCheck(){
        let inputPw = document.getElementById('pw-input').value;
        let inputPwCheck = document.getElementById('pw-check-input').value;
        if(inputPw === inputPwCheck){
            if(inputPw === '' || inputPw.length === 0 || inputPw.length < 8 || inputPw.length > 20 || !pwExp.test(inputPw)){
                $('#pw-check-td').css('display', 'block');
                $('#pw-check-td').css('color', 'red');
                $('#pw-check-td').text('사용 불가능');
            } else {
                $('#pw-check-td').css('display', 'block');
                $('#pw-check-td').css('color', 'green');
                $('#pw-check-td').text('사용 가능');
            }
        } else {
            $('#pw-check-td').css('display', 'block');
            $('#pw-check-td').css('color', 'red');
            $('#pw-check-td').text('비밀번호 확인과 일치 X');
        }
    }

    function inputZipcode(){
        new daum.Postcode({
            oncomplete : function(data){
                document.getElementById('zipcode-input').value = data.zonecode;
                document.getElementById('addr1-input').value = data.address;
            }
        }).open();
    }

    function inputAddress1(){
        new daum.Postcode({
            oncomplete : function(data){
                document.getElementById('zipcode-input').value = data.zonecode;
                document.getElementById('addr1-input').value = data.address;
            }
        }).open();

    function beforeSubmit(){
        let inputId = document.getElementById('id-input').value;
        let inputPw = document.getElementById('pw-input').value;
        let inputName = document.getElementById('name-input').value;
        let inputPhone = document.getElementById('phone-input').value;
        let inputZipcode = document.getElementById('zipcode-input').value;
        let addr1Input = document.getElementById('addr1-input').value;
        // let addr2Input = document.getElementById('addr2-input').value;
        if(!idExp.test(inputId) || !pwExp.test(inputPw) || !nameExp.test(inputName)|| inputPhone.length < 10 ||
            !phoneExp.test(inputPhone) || inputZipcode.length < 1 || addr1Input.length < 1){
            alert("입력 똑바로 안됐다")
            return false;
        } else{
            let regex = / /gi;
            inputId.replace(regex, '');
            inputPw.replace(regex, '');
            inputName.replace(regex, '');
            inputPhone.replace(regex, '');
            alert("잘했다~!")
            document.registerForm.submit();
        }
    }

</script>
</html>

