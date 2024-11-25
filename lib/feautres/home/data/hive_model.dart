import 'package:hive_flutter/hive_flutter.dart';
part 'hive_model.g.dart';
@HiveType(typeId: 0)
class Quote extends HiveObject {
@HiveField(0)
  final String quote ;

  Quote({required this.quote});

}