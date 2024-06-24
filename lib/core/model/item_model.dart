import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String id;
  String name;
  var percentage;
  int passOutYear;
  String city;
  bool isDone;

  ItemModel({
    required this.id,
    required this.name,
    required this.percentage,
    required this.passOutYear,
    required this.city,
    required this.isDone,
  });

  factory ItemModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ItemModel(
      id: doc.id,
      name: doc['name'],
      percentage: doc['percentage'],
      passOutYear: doc['passOutYear'],
      city: doc['city'],
      isDone: doc['isDone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'percentage': percentage,
      'passOutYear': passOutYear,
      'city': city,
      'isDone': isDone,
    };
  }
}