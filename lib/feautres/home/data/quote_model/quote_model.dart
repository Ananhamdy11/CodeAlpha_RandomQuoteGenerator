import 'package:equatable/equatable.dart';
class QuoteModel extends Equatable {
  final int? id;
  final String? languageCode;
  final String? content;
  final String? url;

  const QuoteModel({
    this.id,
    this.languageCode,
    this.content,
    this.url,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json['id'] as int?,
        languageCode: json['language_code'] as String?,
        content: json['content'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'language_code': languageCode,
        'content': content,
        'url': url,
      };

  @override
  List<Object?> get props {
    return [
      id,
      languageCode,
      content,
      url,
    ];
  }
}
