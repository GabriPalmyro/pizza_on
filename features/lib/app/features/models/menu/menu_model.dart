// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MenuModel {
  final String title;
  final String description;
  final double price;
  final String image;

  MenuModel({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  MenuModel copyWith({
    String? title,
    String? description,
    double? price,
    String? image,
  }) {
    return MenuModel(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MenuModel(title: $title, description: $description, price: $price, image: $image)';
  }
}
