import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quote_generator/feautres/home/data/hive_model.dart';
import 'package:quote_generator/feautres/home/presentation/manager/cubit/quote_cubit.dart';
import 'package:quote_generator/feautres/home/presentation/views/home_view.dart';
import 'package:quote_generator/feautres/home/presentation/views/widgets/fetch_quote_button.dart';
import 'package:quote_generator/feautres/home/presentation/views/widgets/quote_body.dart';
import 'package:share_plus/share_plus.dart';

class QuoteViewBody extends StatefulWidget {
  const QuoteViewBody({super.key});

  @override
  State<QuoteViewBody> createState() => _QuoteViewBodyState();
}

class _QuoteViewBodyState extends State<QuoteViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteCubit, QuoteState>(
      builder: (context, state) {
           final cubit = context.read<QuoteCubit>();
        if (state is QuoteSuccess) {
          return Center(child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:5),
                  child: QuoteBody(text: state.quote,),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //FetchQuoteButton(cubit: cubit,),
                    ElevatedButton(onPressed: (){
                      final favoritequote= Quote(
                        quote: state.quote
                        );
                        context.read<QuoteCubit>().addFavorites(favoritequote);
                    }, child: const Row(
                      children: [
                        Icon(Icons.favorite_border,color: Colors.black,),
                        SizedBox(width: 5,),
                        Text('Save',style: TextStyle(
                          color: Colors.black
                        ),)
                      ],
                    )),
                    const SizedBox(width: 20,),
                    ElevatedButton(
                    onPressed: ()=> Share.share(state.quote),
                    child: const Row(
                      children: [
                       Icon(Icons.share,color: Colors.black,),
                        SizedBox(width: 5,),
                        Text('Share',style: TextStyle(color:Colors.black),),
                      ],
                    )
                    ),
              

                  ],
                )
              ],
            ),
          ));
        } else if (state is QuoteFailure) {
         // print(state.error);
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
         return const Center(
            child: CircularProgressIndicator()
          );
        }
      }, 
    );
  }
}

