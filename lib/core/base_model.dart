// have to make a base abstract class for models
import 'package:equatable/equatable.dart';
abstract class BaseModel extends Equatable {
  const BaseModel();

  @override
  List<Object?> get props => [];

  // You can add common methods or properties that all models should have
  // For example, a method to convert the model to a map or JSON
  Map<String, dynamic> toMap();
  
  String toJson() {
    return toMap().toString(); // or use a proper JSON encoder
  }
}