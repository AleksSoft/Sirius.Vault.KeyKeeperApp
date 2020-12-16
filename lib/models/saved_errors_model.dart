import 'base_model.dart';

class SavedErrorsModel extends BaseModel<SavedErrorsModel> {
  List<SavedError> errors = [];

  @override
  SavedErrorsModel fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = <SavedError>[];
      json['errors'].forEach((v) {
        errors.add(SavedError().fromJson(v));
      });
    }
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [errors];
}

class SavedError extends BaseModel<SavedError> {
  String code;
  String message;
  String method;
  int timestamp;

  @override
  SavedError fromJson(Map<String, Object> json) {
    code = json['code'];
    message = json['message'];
    method = json['method'];
    timestamp = json['timestamp'];
    return this;
  }

  @override
  Map<String, Object> toJson() => {
        'code': code,
        'message': message,
        'method': method,
        'timestamp': timestamp,
      };

  @override
  List<Object> get props => [code, message, method, timestamp];
}
