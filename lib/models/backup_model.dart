import 'dart:convert';

import 'package:equatable/equatable.dart';

class BackupModel with EquatableMixin {
  String publicKeyPem;
  String privateKeyPem;

  BackupModel({this.publicKeyPem, this.privateKeyPem});

  BackupModel.fromJson(Map<String, dynamic> json) {
    publicKeyPem = json['publicKeyPem'];
    privateKeyPem = json['privateKeyPem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publicKeyPem'] = this.publicKeyPem;
    data['privateKeyPem'] = this.privateKeyPem;
    return data;
  }

  @override
  List<Object> get props => [publicKeyPem, privateKeyPem];

  @override
  String toString() => json.encode(this.toJson());
}
