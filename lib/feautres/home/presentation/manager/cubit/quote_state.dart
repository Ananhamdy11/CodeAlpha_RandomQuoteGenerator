part of 'quote_cubit.dart';

class QuoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class QuoteInitial extends QuoteState {}

final class QuoteLoading extends QuoteState {}

final class QuoteSuccess extends QuoteState {
  final String quote;
  QuoteSuccess(this.quote);
}

final class QuoteFailure extends QuoteState {
  final String error;

  QuoteFailure(this.error);
}


final class FavoriteSuccessQuoteState extends QuoteState {
  final List <Quote> favorites;

  FavoriteSuccessQuoteState(this.favorites);

}

final class FavoriteLoadingQuoteState extends QuoteState {}
final class FavoriteQuoteFailureState extends QuoteState {
  final String error;

  FavoriteQuoteFailureState(this.error);

}

