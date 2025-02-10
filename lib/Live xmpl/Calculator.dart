import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {

   Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _input = '';
  String operand = '';
  double num1= 0;
  double num2 = 0;
  String  iconoperand ='';

  void pressbutton(String value){
    setState(() {
      if(value == 'C'){
         _output = '0';
         _input = '';
         operand = '';
         num1= 0;
         num2 = 0;
          iconoperand ='';
      }
      else if(['+','-','×','÷'].contains(value)){
        num1 = double.parse(_input);
        operand = value;
        _input = '';
        iconoperand = operand;
      }
      else if(value == '='){
        num2 = double.parse(_input);
        if(operand == '+'){
          _output = (num1 + num2).toString();
        }else if(operand == '-'){
          _output = (num1 - num2).toString();

        }else if(operand == '×'){
          _output = (num1 * num2).toString();

        }else if(operand == '÷'){
          _output = num2 != 0 ?(num1 / num2).toString() : 'Math Error';

        }
        _input = _output;
      } else{
        _input +=value;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Text(iconoperand,style: TextStyle(color: Colors.white,fontSize: 30),),
                  ),
                ],
              ),


              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text(_output,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold
                  ) ,),
              ),
            ],
          ),
          SizedBox(height: 30,),

          Column(
            children: [
              Row(
                children: [
                  calculator_button(titletext: '%',onclick: ()=> {},),
                  calculator_button(titletext: '+/-',onclick: ()=> {},),
                  calculator_button(titletext: '()',onclick: ()=> {},),
                  calculator_button(titletext: '÷',buttoncolor: Colors.orange,onclick: ()=> pressbutton('÷'),),

                ],
              ),
              Row(
                children: [
                  calculator_button(titletext: '7',onclick: ()=> pressbutton('7'),),
                  calculator_button(titletext: '8',onclick: ()=> pressbutton('8'),),
                  calculator_button(titletext: '9',onclick: ()=> pressbutton('9'),),
                  calculator_button(titletext: '×',buttoncolor: Colors.orange,onclick: ()=> pressbutton('×'),),


                ],
              ),
              Row(
                children: [
                  calculator_button(titletext: '4',onclick: ()=> pressbutton('4'),),
                  calculator_button(titletext: '5',onclick: ()=> pressbutton('5'),),
                  calculator_button(titletext: '6',onclick: ()=> pressbutton('6'),),
                  calculator_button(titletext: '-',buttoncolor: Colors.orange,onclick: ()=> pressbutton('-'),),

                ],
              ),
              Row(
                children: [
                  calculator_button(titletext: '3',onclick: ()=> pressbutton('3'),),
                  calculator_button(titletext: '2',onclick: ()=> pressbutton('2'),),
                  calculator_button(titletext: '1',onclick: ()=> pressbutton('1'),),
                  calculator_button(titletext: '+',buttoncolor: Colors.orange,onclick: ()=> pressbutton('+'),),

                ],
              ),
              Row(
                children: [
                  calculator_button(titletext: 'C',buttoncolor: Colors.red,onclick: ()=> pressbutton('C'),),
                  calculator_button(titletext: '0',onclick: ()=> pressbutton('0'),),
                  calculator_button(titletext: '.',buttoncolor: Colors.orange[500],onclick: ()=> pressbutton('.'),),
                  calculator_button(titletext: '=',buttoncolor: Colors.green,onclick: ()=> pressbutton('='),),

                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class calculator_button extends StatelessWidget {
  String titletext;
  Color ? buttoncolor;
  final VoidCallback onclick;

   calculator_button({
    super.key,
     required this. titletext,
     this.buttoncolor,
     required this.onclick
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
            onPressed: onclick,
            child: Text(titletext,style: TextStyle(fontSize: 24),),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttoncolor ?? Colors.teal[600],
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

          ),
        ),
      ),
    );
  }
}
