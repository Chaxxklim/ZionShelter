<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>calculator</title>
</head>
<body>
    <div class="main-container">
        <div class="top-container">
            <input type="text" id="number-input" readonly>
        </div>
        <div class="bottom-container">
            <div class="number-button">
                <div>
                    <button class="operator-btn" type="button" value="+" onclick="operatorBtn(this.value)">+</button>
                    <button class="operator-btn" type="button" value="-" onclick="operatorBtn(this.value)">-</button>
                    <button class="operator-btn" type="button" value="*" onclick="operatorBtn(this.value)">X</button>
                    <button class="operator-btn" type="button" value="/" onclick="operatorBtn(this.value)">/</button>
                    <button class="operator-btn" type="button" value="=" onclick="resultBtn()">=</button>
                </div>
                <div>
                    <button type="button" value="7" onclick="numberBtn(this.value)">7</button>
                    <button type="button" value="8" onclick="numberBtn(this.value)">8</button>
                    <button type="button" value="9" onclick="numberBtn(this.value)">9</button>
                </div>
                <div>
                    <button type="button" value="4" onclick="numberBtn(this.value)">4</button>
                    <button type="button" value="5" onclick="numberBtn(this.value)">5</button>
                    <button type="button" value="6" onclick="numberBtn(this.value)">6</button>
                </div>
                <div>
                    <button type="button" value="1" onclick="numberBtn(this.value)">1</button>
                    <button type="button" value="2" onclick="numberBtn(this.value)">2</button>
                    <button type="button" value="3" onclick="numberBtn(this.value)">3</button>
                </div>
                <div>
                    <button type="button" value="0" onclick="numberBtn(this.value)">0</button>
                    <button type="button" value="." onclick="numberBtn(this.value)">.</button>
                    <button type="button" value="reset" onclick="resetBtn()">reset</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    let numberState = false;
    let operatorState = false;
    let operator;
    let firstNumber;
    let secondNumber;
    let result;
    let numbers = [];

    function operatorBtn(e){
        if(operator != null){
            return false;
        }else{
            operator = e;
            let value = document.getElementById('number-input').value;
            value = value + e;
            document.getElementById('number-input').setAttribute('value', value);
        }

    }

    function numberBtn(e){
        let value = document.getElementById('number-input').value;
        value = value + e;

        if(value.includes('+') || value.includes('-') || value.includes('*') || value.includes('/')){
            let numberArray = value.split(operator);
            numbers = value.split(operator);
            firstNumber = numberArray[0];
            secondNumber = numberArray[1];


            for(let i = 0; i < firstNumber.length; i++){
                if(firstNumber.charAt(i) === '0' && firstNumber.charAt(i+1) !== '.' && i === 0 && firstNumber.length > 1){
                    firstNumber = firstNumber.substring(i + 2);
                } else if(firstNumber.charAt(i) === '.' && firstNumber.charAt(i + 1) === '.'){
                    firstNumber = firstNumber.substring(0, i);
                }
            }
            for(let i = 0; i < secondNumber.length; i++){
                if(secondNumber.charAt(i) === '0' && secondNumber.charAt(i+1) !== '.' && i === 0 && secondNumber.length > 1){
                    secondNumber = secondNumber.substring(i + 2);
                } else if(secondNumber.charAt(i) === '.' && secondNumber.charAt(i + 1) === '.'){
                    secondNumber = secondNumber.substring(0, i);
                }
            }
            firstNumber = firstNumber + "";
            secondNumber = secondNumber + "";
            value = firstNumber + operator + secondNumber;
        } else{
            for(let i = 0; i < value.length; i++){
                if(value.charAt(i) === '0' && value.charAt(i+1) !== '.' && i === 0 && value.length > 1){
                    console.log("else")
                    value = value.substring(i + 2);
                } else if(value.charAt(i) === '.' && value.charAt(i + 1) === '.'){
                    value = value.substring(0, i);
                }
            }
        }
        document.getElementById('number-input').setAttribute('value', value);
    }

    function resetBtn(){
        numberState = false;
        operatorState = false;
        firstNumber = "";
        secondNumber = "";
        operator = null;
        result = "";
        document.getElementById('number-input').setAttribute('value', '');
    }

    function resultBtn(){
        let value = document.getElementById('number-input').value;
        let numberArray = value.split(operator);
        if(numberArray != null && value !== "" && operator !== "" && operator != null){
            // firstNumber = parseFloat(numberArray[0]);
            // secondNumber = parseFloat(numberArray[1]);
            if(operator === '+') result = parseFloat(firstNumber) + parseFloat(secondNumber);
            else if(operator === '-') result = parseFloat(firstNumber) - parseFloat(secondNumber);
            else if(operator === '*') result = parseFloat(firstNumber) * parseFloat(secondNumber);
            else if(operator === '/') result = parseFloat(firstNumber) / parseFloat(secondNumber);
            // result = eval(value);

            document.getElementById('number-input').setAttribute('value', result);
            numberState = false;
            operatorState = false;
            secondNumber = "";
            operator = null;
            firstNumber = result;

        } else{
            alert("number null..")
        }


    }
</script>
</html>