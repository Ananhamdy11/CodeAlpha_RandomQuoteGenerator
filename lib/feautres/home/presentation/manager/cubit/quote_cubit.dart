
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quote_generator/feautres/home/data/hive_model.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
final Dio dio= Dio();
final String url='https://quotes15.p.rapidapi.com/quotes/random/?language_code=en';
QuoteCubit(this.favoriteQuotesBox) : super(QuoteInitial());

final Box<Quote> favoriteQuotesBox ;

Color currentColor= Colors.black;

   void getNewQuote(){
        currentColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

   }
void loadFavorits(){
  emit(FavoriteLoadingQuoteState());
try{
  final favoritesQuotes =favoriteQuotesBox.values.toList().cast<Quote>();
    //print('Loaded Favorites: ${favoritesQuotes.map((q) => q.quote).toList()}'); // Debug log

if(favoritesQuotes.isNotEmpty){
emit(FavoriteSuccessQuoteState(favoritesQuotes));
}else{
  emit(FavoriteQuoteFailureState('No Favorite Quotes ! '));
}
}catch(e){
  emit(FavoriteQuoteFailureState(e.toString()));
}

}

void addFavorites(Quote favoritesQuotes){
  try {
    if(!favoriteQuotesBox.values.contains(favoritesQuotes)){
    favoriteQuotesBox.add(favoritesQuotes);

    }
    loadFavorits();
        getNewQuote();

  } catch (e) {
    emit(FavoriteQuoteFailureState(e.toString()));
    
  }

}

void deleteFavoriteQuote(int index) async{

  try {
    if(index< favoriteQuotesBox.length){
    await favoriteQuotesBox.deleteAt(index);
    loadFavorits();
    }else {
      emit(FavoriteQuoteFailureState("Invalid index for deletion."));
    }

    
  } catch (e) {
    emit(FavoriteQuoteFailureState(e.toString()));
  }
}


Future<void> fetchQuote () async{

  emit(QuoteLoading());

  try{
    final response= await dio.get(url,
    options: Options(
          headers: {
            'x-rapidapi-host': 'quotes15.p.rapidapi.com',
            'x-rapidapi-key': '3cf9ff0f5amshda19414c4e5afecp137d26jsn653fe4906920',
          },
        ),
    );
      final quote = response.data['content'];
    emit(QuoteSuccess(quote));

  }catch(ex){
    emit(QuoteFailure(ex.toString()));
  }

}





}
