import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator/feautres/home/presentation/manager/cubit/quote_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteCubit, QuoteState>(
      builder: (context, state) {
        if(state is QuoteLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else if(state is FavoriteQuoteState){
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.favorites.length,
                    itemBuilder: (context,index){
                      final favoriteQuotes= state.favorites[index];

                      return Container(
                       width: MediaQuery.of(context).size.width*0.9,
                       height: MediaQuery.of(context).size.height*0.25,
                       decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),

                       ),
                       child: Row(
                         children: [

                           Column(
                            children: [
                              Text(favoriteQuotes.quote),
                              const SizedBox(height: 10,),
                              Text(TimeOfDay.now().toString())
                            ],
                           ),
                           IconButton(
                            onPressed: (){
                              context.read<QuoteCubit>().deleteFavoriteQuote(index);
                            },
                             icon:const Icon(Icons.delete)
                             )
                         ],
                       ),
                      );

                    }
                    )
                  )
              ],
            ),
          );
        }else{
          return const Center(child: Text("NO Favorites Quotes ! "),);
        }
      },
    );
}
}