// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Dog {
  String message;
 String success;
  Dog({
    required this.message,
    required this.success,
  });

  

  Dog copyWith({
    String? message,
    String? success,
  }) {
    return Dog(
      message: message ?? this.message,
      success: success ?? this.success,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'success': success,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      message: map['message'],
      success: map['status']
    );
  }

  String toJson() => json.encode(toMap());

  factory Dog.fromJson(String source) => Dog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Dog(message: $message, success: $success)';

  @override
  bool operator ==(covariant Dog other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.success == success;
  }

  @override
  int get hashCode => message.hashCode ^ success.hashCode;
}
