import 'package:equatable/equatable.dart';

class Originator extends Equatable {
  final int? id;
  final String? languageCode;
  final String? description;
  final int? masterId;
  final String? name;
  final String? url;

  const Originator({
    this.id,
    this.languageCode,
    this.description,
    this.masterId,
    this.name,
    this.url,
  });

  factory Originator.fromJson(Map<String, dynamic> json) => Originator(
        id: json['id'] as int?,
        languageCode: json['language_code'] as String?,
        description: json['description'] as String?,
        masterId: json['master_id'] as int?,
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'language_code': languageCode,
        'description': description,
        'master_id': masterId,
        'name': name,
        'url': url,
      };

  @override
  List<Object?> get props {
    return [
      id,
      languageCode,
      description,
      masterId,
      name,
      url,
    ];
  }
}
