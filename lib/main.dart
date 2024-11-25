import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator/feautres/home/data/hive_model.dart';
import 'package:quote_generator/feautres/home/presentation/manager/cubit/quote_cubit.dart';
import 'package:quote_generator/feautres/home/presentation/views/quote_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{
await Hive.initFlutter();
final favoriteQuotesBox = await Hive.openBox<Quote>('favorites');
Hive.registerAdapter(QuoteAdapter());

// await Hive.openBox<String>('favorites');

  runApp( MyApp(favoriteQuotesBox: favoriteQuotesBox,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.favoriteQuotesBox});
    final Box<Quote> favoriteQuotesBox ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteCubit(favoriteQuotesBox)..fetchQuote(),
      child: const MaterialApp(
          title: 'Random Quote Generator',
          debugShowCheckedModeBanner: false,
          home: QuoteView()),
    );
  }
}
