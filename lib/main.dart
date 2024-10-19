import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator/feautres/home/presentation/manager/cubit/quote_cubit.dart';
import 'package:quote_generator/feautres/home/presentation/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteCubit(),
      child: const MaterialApp(
          title: 'Random Quote Generator',
          debugShowCheckedModeBanner: false,
          home:const  HomeView()),
    );
  }
}
