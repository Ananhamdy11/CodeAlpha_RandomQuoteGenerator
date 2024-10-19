
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
final Dio dio= Dio();
final String url='https://quotes15.p.rapidapi.com/quotes/random/?language_code=en';
QuoteCubit() : super(QuoteInitial());



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
