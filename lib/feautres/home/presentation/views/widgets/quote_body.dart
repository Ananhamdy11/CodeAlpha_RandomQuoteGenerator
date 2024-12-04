import 'dart:math';

import 'package:flutter/material.dart';
class QuoteBody extends StatelessWidget {
  const QuoteBody({super.key, this.text, this.share});
   final String? text;
   final VoidCallback? share;


   Color _generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width:double.infinity,
      height: MediaQuery.of(context).size.height*0.60,
      decoration: BoxDecoration(
        color: _generateRandomColor(),
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(text.toString(),softWrap: true,style:const TextStyle(
            
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            
                                     
          
          )),
        ),
      ),
    );
  }
}





//SizedBox(width: 20,),
                    //  