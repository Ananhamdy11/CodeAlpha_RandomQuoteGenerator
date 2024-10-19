import 'package:flutter/material.dart';
import 'package:quote_generator/feautres/home/presentation/manager/cubit/quote_cubit.dart';

class FetchQuoteButton extends StatelessWidget {
  const FetchQuoteButton({
    super.key,
    required this.cubit,
  });

  final QuoteCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          cubit.fetchQuote();
        },
        child:const Text('New Quote',style: TextStyle(color:Colors.black),)
        );
  }
}