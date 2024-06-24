import 'package:cloud_firestore/cloud_firestore.dart';
class HrmModel {
  String id;
  String content;
  Timestamp createdOn;
  bool isDone;

  HrmModel({
    required this.id,
    required this.content,
    required this.createdOn,
    required this.isDone,
  });

  factory HrmModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return HrmModel(
      id: doc.id,
      content: doc['content'],
      createdOn: doc['createdon'],
      isDone: doc['isDone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'createdon': createdOn,
      'isDone': isDone,
    };
  }
}


