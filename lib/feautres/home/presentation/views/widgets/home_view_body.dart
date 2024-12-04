import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator/feautres/home/presentation/manager/cubit/quote_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

Color _generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<QuoteCubit, QuoteState>(
      builder: (context, state) {
          if (state is FavoriteLoadingQuoteState) {
      return const Center(child: CircularProgressIndicator());
    } else if(state is FavoriteSuccessQuoteState){
         // print(context.read<QuoteCubit>().favoriteQuotesBox.values);
          if (state.favorites.isEmpty) {
        return const Center(child: Text('No Favorite Quotes!'));
      }
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.favorites.length,
                    itemBuilder: (context,index){
                      final favoriteQuotes= state.favorites[index];

                      return Column(
                        children: [
                          Container(
                           width: MediaQuery.of(context).size.width*0.95,
                           decoration: BoxDecoration(
                            color:_generateRandomColor(),
                            borderRadius: BorderRadius.circular(15),
                          
                           ),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                          
                               Flexible(
                                 child: Padding(
                                   padding: const EdgeInsets.all(8),
                                   child: Text(favoriteQuotes.quote,softWrap: true,
                                   
                                  // overflow: TextOverflow.ellipsis,
                                   style:const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                   ),
                                                                   ),
                                 ),
                               ),
                               IconButton(
                                onPressed: (){
                                  context.read<QuoteCubit>().deleteFavoriteQuote(index);
                                },
                                 icon:const Icon(Icons.delete,color: Colors.white,)
                                 )
                             ],
                           ),
                          ),
                          const SizedBox(height: 20,)
                        ],
                      );

                    }
                    )
                  )
              ],
            ),
          );
        }else if (state is FavoriteQuoteFailureState) {
      return Center(child: Text(state.error));
    }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
}
}