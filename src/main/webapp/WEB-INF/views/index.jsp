<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring Boot Application with JSP</title></head>
<body>
<div class="greetings-container">
    <div class="greetings-img-div">
        <img class="greetings-img" src="http://placeimg.com/640/480/any" alt="">
    </div>
    <div class="greetings-text-div">
        <div class="greetings-highlight-div">
            인사말
        </div>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat.
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
        sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    </div>
</div>
<div class="donation-container">
    <div class="donation-img-div">

    </div>
    <div class="donation-url-div">
        <a href="http://www.google.com">
            <img class="donation-img" src="http://placeimg.com/640/480/any" alt="">
        </a>
    </div>
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
    .greetings-container{
        width: auto;
        height: calc(100vh - 50px);
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }
    .greetings-img{
        width: 150px;
        height: 150px;
    }
    .greetings-text-div{
        width: auto;
        height: 60%;
        display: flex;
        justify-content: space-around;
        flex-direction: column;
        align-items: center;
    }
    .donation-container{
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }
    .donation-img{
        width: 250px;
        height: 150px;
    }
    .greetings-highlight-div{
        font-size: 45px;
        color: antiquewhite;
    }
</style>
</html>

