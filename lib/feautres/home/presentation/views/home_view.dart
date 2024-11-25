import 'package:flutter/material.dart';
import 'package:quote_generator/feautres/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Center(child: Text('DQUOTE')),
      ),
      body:const HomeViewBody(),
    );
  }
}