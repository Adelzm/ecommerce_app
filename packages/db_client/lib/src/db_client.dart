import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_client/src/db_record.dart';

class DbClient {
  final FirebaseFirestore _db;

  DbClient({FirebaseFirestore? db}) : _db = db ?? FirebaseFirestore.instance;

  Future<String> add({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docRef = await _db.collection(collectionName).add(data);
      return docRef.id;
    } catch (error) {
      throw Exception('Error adding document to database: $error');
    }
  }

  Future<List<DbRecord>> fetchAll({
    required String collectionName,
  }) async {
    try {
      final documents = await _db.collection(collectionName).get();
      return documents.docs.map((doc) => DbRecord(id: doc.id, data: doc.data())).toList();
    } catch (error) {
      throw Exception('Error fetching documents from database: $error');
    }
  }
}
