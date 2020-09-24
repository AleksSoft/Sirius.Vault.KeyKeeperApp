import 'package:equatable/equatable.dart';

abstract class BaseModel<T> with EquatableMixin {
  T fromJson(Map<String, dynamic> json);

  external Map<String, dynamic> toJson();

  @override
  bool get stringify => true;
}
