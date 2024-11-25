
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quote_generator/feautres/home/data/hive_model.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
final Dio dio= Dio();
final String url='https://quotes15.p.rapidapi.com/quotes/random/?language_code=en';
QuoteCubit(this.favoriteQuotesBox) : super(QuoteInitial());

final Box<Quote> favoriteQuotesBox ;

void loadFavorits(){
  emit(QuoteLoading());
final favoritesQuotes =favoriteQuotesBox.values.toList().cast<Quote>();
if(favoritesQuotes.isNotEmpty){
emit(FavoriteQuoteState(favoritesQuotes));
}else{
  emit(QuoteFailure('No Favorite Quotes ! '));
}

}

void addFavorites(Quote favoritesQuotes){
  try {
    favoriteQuotesBox.add(favoritesQuotes);
    loadFavorits();
  } catch (e) {
    emit(QuoteFailure(e.toString()));
    
  }

}

void deleteFavoriteQuote(int index) async{

  try {
    await favoriteQuotesBox.deleteAt(index);
    loadFavorits();
  } catch (e) {
    emit(QuoteFailure(e.toString()));
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
