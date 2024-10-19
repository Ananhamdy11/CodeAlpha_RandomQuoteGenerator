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
