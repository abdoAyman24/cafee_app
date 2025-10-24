import 'package:caffee/Core/service/data_base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService extends DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  
  @override
  Future<void> addUser({
    required String path,
    required Map<String, dynamic> json,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(json);
    } else {
      await firestore.collection(path).add(json);
    }
  }

  @override
  Future<Map<String, dynamic>> getUser({
    required String path,
    required String documentId,
  }) async {
    var json = await firestore.collection(path).doc(documentId).get();
    return json.data() as Map<String ,dynamic>;
  }
}
