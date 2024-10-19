import 'package:flutter/material.dart';
import 'package:quote_generator/feautres/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold( 
      body: HomeViewBody(),
      backgroundColor: Color(0xff000000)
    );
  }
}
