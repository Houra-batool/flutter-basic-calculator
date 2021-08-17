import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
 late final String textt ;
 late final int fillColor;
 late final int textColor;
  final double textSize ;
  final VoidCallback? callBack;
  
  Button(
    {
  required this.textt,
   required this.fillColor,
   required this.textColor,
   required this.textSize,
   required this.callBack,
   });
   
 
 
 
  @override
  Widget build(BuildContext context) {
    return  Container(
                      margin: EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        
                        // ignore: deprecated_member_use
                        child: ElevatedButton(
                        // shape: RoundedRectangleBorder(
                         //    borderRadius: BorderRadius.circular(5.0)),
                          child: Text( textt,
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle( fontSize: textSize,
                              color:Color(textColor) )
                              
                            ),
                          ),
                        //  color:Colors.pink ,
                        // textColor: Color(textColor),
                          onPressed: callBack,
                          style: ButtonStyle(backgroundColor:
                           MaterialStateProperty.all(Color(fillColor) )

                           ),
                          
                        ),
                      ),
                    );
    
  }
}

