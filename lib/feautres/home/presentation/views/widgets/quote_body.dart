import 'package:flutter/material.dart';
class QuoteBody extends StatelessWidget {
  const QuoteBody({super.key, this.text, this.share});
   final String? text;
   final VoidCallback? share;
  @override
  Widget build(BuildContext context) {

    return Container(
      width:double.infinity,
      //height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(text.toString(),maxLines: 4,style:const TextStyle(
          color: Colors.black,
          fontSize: 18,
        
        )),
      ),
    );
  }
}





//SizedBox(width: 20,),
                    //  