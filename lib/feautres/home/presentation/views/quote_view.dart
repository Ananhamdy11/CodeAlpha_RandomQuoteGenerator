import 'package:flutter/material.dart';
import 'package:quote_generator/feautres/home/presentation/views/widgets/quote_view_body.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      appBar: AppBar(
        title:const Center(
          child: Text('DQUOTE',style: TextStyle(color: Colors.black),),
        ),
      ),
      body:const QuoteViewBody(),
    );
  }
}
