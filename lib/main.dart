
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatefulWidget {
  

  @override
  _MyCalculatorAppState createState() => _MyCalculatorAppState();
}

class _MyCalculatorAppState extends State<MyCalculatorApp> {
 late int firstNum;
 late int secondNum;
 late String history = '';
  String textToDisplay = '';
 late String res ;
 late String operation;


 void btnOnClick(String btnValue) {
print(btnValue);
  if( btnValue == 'C'){
     setState( (){
    
   firstNum = 0;
   secondNum = 0;
   textToDisplay = '';
   res = '';
   });
  }
  else if( btnValue == 'AC'){
    setState( (){
    
   firstNum = 0;
   secondNum = 0;
   history = '';
   textToDisplay = '';
   res = '';
   });
    }
    else if( btnValue == '<'){
      
          setState( (){
      textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1); });
      
       
         }
    
  else if (btnValue == '+' ||
            btnValue == '-' ||
            btnValue == 'x' ||
            btnValue == '/' )
          {
           // firstNum = int.parse(textToDisplay);
           // res ='';
           // operation = btnValue;
           setState( (){
    textToDisplay =  textToDisplay + btnValue ;
  }); 
          }
   else if( btnValue == '=')
   {
     /* firstNum = int.parse(textToDisplay);
     if(operation == '+')
     {
        res = (firstNum + secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString(); 
     }
     else if(operation == '-')
     {
        res = (firstNum - secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString(); 
     }
     else if(operation == 'X')
     {
        res = (firstNum * secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString(); 
     }
     else if(operation == '/')
     {
        res = (firstNum / secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString(); 
     }*/
     Parser p =  Parser();
     Expression exp = p.parse(textToDisplay);
     ContextModel cm =  ContextModel();
     double eval = exp.evaluate(EvaluationType.REAL, cm);

     setState( (){
       history = textToDisplay + '=' + eval.toString() ;
    textToDisplay = eval.toString();
    
  }); 
   }
   else
   {
   //res = int.parse(textToDisplay + btnValue).toString(); 
  setState( (){
    textToDisplay =  textToDisplay +btnValue ;
  }); 
   }
}
/*void acFunc(){
  setState( (){
    firstNum = 0;
   secondNum = 0;
   history = '';
   textToDisplay = '';
   res = '';
    
  });
}
void cFunc(){
  setState( (){
    firstNum = 0;
   secondNum = 0;
   textToDisplay = '';
   res = '';
    
  });
}*/
       
   
  
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      title: 'calculator',
      home: Scaffold(
      
        
        appBar: AppBar(
          title: Text('My Caculator App'),
        ),
        body:  
           SingleChildScrollView(
             child: Container(
              
                color: Colors.blueGrey,
                
                    child: Column(
                      mainAxisAlignment :MainAxisAlignment.start,
                      children: [
                          
                         Container(
                          
                           padding: EdgeInsets.only(right: 12),
                        
                            child: Text( history,
                         style: GoogleFonts.rubik(
                           textStyle: TextStyle(
                             fontSize:24,
                             color: Color(0x66FFFFFF),)
                         ),    
                            ),
                             
                             alignment: Alignment(1.0,1.0),
                        ),
                          
                        Container(
                          child : Padding(
                            padding: EdgeInsets.all(5),
                            child: Text( textToDisplay,
                         style: GoogleFonts.rubik(
                           textStyle: TextStyle(
                             fontSize:48,
                             color: Colors.white,)
                         ),    
                            ),
                             ),
                             alignment: Alignment(1.0,1.0),
                        ),
                    /*    Container( 
                          child : Button(textt: 'AC',
                              textColor: 0xFF000000,
                              textSize: 8 ,
                              fillColor: 0xFF8ac4d0,
                               callBack: null,
                               ),
                  
                        ),*/
                         Row(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                            children: [
                             
                              Button(textt: 'AC',
                              textColor: 0xFF000000,
                              textSize: 18 ,
                              fillColor: 0xFF8ac4d0,
                               callBack:() {btnOnClick('AC');} ,
                               ),
                                 
                             Button(textt: 'C',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFF8ac4d0,
                               callBack: () {btnOnClick('C');},
                               ),
                                 
                                 Button(textt: '<',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFFf4d160,
                               callBack: () {btnOnClick('<');},
                               ),
                                 
                            Button(textt: '/',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFFf4d160,
                               callBack: () {btnOnClick('/');},
                               ),
                              
                            ],
                            
                                        ),
                          Row(
                           mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                            children: [
                              Button(textt: '9',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFF8ac4d0,
                               callBack: () {btnOnClick('9');},
                               
                               ),
                              Button(textt: '8',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFF8ac4d0,
                               callBack:() {btnOnClick('8');},
                               ),
                            
                              Button(textt: '7',
                              textColor: 0xFF000000,
                              textSize: 22,
                              fillColor: 0xFF8ac4d0,
                               callBack:() {btnOnClick('7');} ,
                               ),
                            
                             Button(textt: '*',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFFf4d160,
                               callBack:() {btnOnClick('*');},
                               ),
                              
                            ],
                            
                                         ),
                          Row(
                           
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                            children: [
                              
                              Button(textt: '6',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFF8ac4d0,
                               callBack: () {btnOnClick('6');},
                               ),
                            
                              Button(textt: '5',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFF8ac4d0,
                               callBack: () {btnOnClick('5');},
                               ),
                            
                                Button(textt: '4',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFF8ac4d0,
                               callBack: () {btnOnClick('4');} ,
                               ),
                            
                           Button(textt: '-',
                              textColor: 0xFF000000,
                              textSize: 22 ,
                              fillColor: 0xFFf4d160,
                               callBack: () {btnOnClick('-');},
                               ),
                              
                            ],
                            
                                           ),
                         
                            Row(
                              
                              mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                              children: [
                                
                                Button(textt: '3',
                                textColor: 0xFF000000,
                                textSize: 22 ,
                                fillColor: 0xFF8ac4d0,
                                 callBack: () {btnOnClick('3');},
                                 ),
                              
                                Button(textt: '2',
                                textColor: 0xFF000000,
                                textSize: 22 ,
                                fillColor: 0xFF8ac4d0,
                                 callBack: () {btnOnClick('2');} ,
                                 ),
                              
                               Button(textt: '1',
                                textColor: 0xFF000000,
                                textSize: 22 ,
                                fillColor: 0xFF8ac4d0,
                                 callBack: () {btnOnClick('1');},
                                 ),
                              
                                Button(textt: '+',
                                textColor: 0xFF000000,
                                textSize: 22,
                                fillColor: 0xFFf4d160,
                                 callBack:() {btnOnClick('+');} ,
                                 ),
                              
                                  ],
                              
                           
                         ),
                        
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                          children: [ 
                            Button(textt: '^',
                            textColor: 0xFF000000,
                            textSize: 22,
                            fillColor: 0xFF8ac4d0,
                             callBack: () {btnOnClick('^');},
                             ),
                          
                            Button(textt: '0',
                            textColor: 0xFF000000,
                            textSize: 22 ,
                            fillColor: 0xFF8ac4d0,
                             callBack:() {btnOnClick('0');} ,
                             ),
                          
                             Button(textt: '00',
                            textColor: 0xFF000000,
                           textSize: 22 ,
                            fillColor: 0xFF8ac4d0,
                            callBack: () {btnOnClick('00');},
                            ),
                          
                          Button(textt: '=',
                            textColor: 0xFF000000,
                            textSize: 22,
                            fillColor: 0xFF8ac4d0,
                             callBack:() {btnOnClick('=');} ,
                             ),
                            
                          ],
                          
                        ),
                         ],
                    ),
                  ),
                ),
           ),
           
    );
  }
 }



















