import 'package:flutter/material.dart';
class QuoteBody extends StatelessWidget {
  const QuoteBody({super.key, this.text, this.share});
   final String? text;
   final VoidCallback? share;
  @override
  Widget build(BuildContext context) {

    return Container(
      width:double.infinity,
      height: MediaQuery.of(context).size.height*0.60,
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Center(
        child: Text(text.toString(),style:const TextStyle(
          color: Colors.white,
          fontSize: 18,
        
        )),
      ),
    );
  }
}





//SizedBox(width: 20,),
                    //  