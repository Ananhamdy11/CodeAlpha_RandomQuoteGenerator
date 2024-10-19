import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator/feautres/home/presentation/manager/cubit/quote_cubit.dart';
import 'package:quote_generator/feautres/home/presentation/views/widgets/fetch_quote_button.dart';
import 'package:quote_generator/feautres/home/presentation/views/widgets/quote_body.dart';
import 'package:share_plus/share_plus.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteCubit, QuoteState>(
      builder: (context, state) {
           final cubit = context.read<QuoteCubit>();

        if (state is QuoteLoading) {
          return const Center(
            child: CircularProgressIndicator()
          );
        } else if (state is QuoteSuccess) {
          return Center(child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuoteBody(text: state.quote,),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FetchQuoteButton(cubit: cubit,),
                    const SizedBox(width: 20,),
                    ElevatedButton(
                    onPressed: ()=> Share.share(state.quote),
                    child: Text('Share',style: TextStyle(color:Colors.black),)
                    ),
              

                  ],
                )
              ],
            ),
          ));
        } else if (state is QuoteFailure) {
          print(state.error);
          return Center(child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuoteBody(text: state.error,),
                const SizedBox(height: 20,),
                FetchQuoteButton(cubit: cubit,)
              ],
            ),
          ));
        
        } else {
          return Center(child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const QuoteBody(text: 'Press To Get Quote ! ',),
                const SizedBox(height: 20,),
                FetchQuoteButton(cubit: cubit,)
              ],
            ))
            );
        }
      },
    );
  }
}

