<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>calculator2</title>
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
    let string;

    function operatorBtn(e){
        operator = e;
        let value = document.getElementById('number-input').value;
        if(value.charAt(value.length - 1) === '+' || value.charAt(value.length - 1) === '-' ||
            value.charAt(value.length - 1) === '*' || value.charAt(value.length - 1) === '/'){
            return false;
        }
        value = value + e;
        string = value;
        numbers.push(string);
        document.getElementById('number-input').setAttribute('value', value);
    }

    function numberBtn(e){
        let value = document.getElementById('number-input').value;

        if(value.charAt(0) === '0' && e === '0'){
            document.getElementById('number-input').setAttribute('value', '');
            return  false;
        }
        if(value.charAt(value.length -1) === '0' && e === '.'){
            value = value + e;
            string = value;
            numbers.push(string);
            document.getElementById('number-input').setAttribute('value', value);
        }else if(value.charAt(value.length -1) === '.' && e === '.'){
            return false;
        } else{
            value = value + e;
        }

        string = value;
        numbers.push(string);
        document.getElementById('number-input').setAttribute('value', value);
        // if(numbers[numbers.length - 1].charAt(numbers[numbers.length - 1].length - 1) === '0' && e === '0'){
        //     return false;
        // 염오줌 소스도 참고...
        // 머근이형 소스도 참고할것

        // }
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
        try {
            document.getElementById('number-input').setAttribute('value', eval(numbers[numbers.length - 1]));
        } catch (error){
            alert(error);
        }

    }
</script>
</html>