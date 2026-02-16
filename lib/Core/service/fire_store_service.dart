import 'dart:developer';

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

  // @override
  // Future<Map<String, dynamic>> getUser({
  //   required String path,
  //   required String documentId,
  // }) async {
  //   var json = await firestore.collection(path).doc(documentId).get();
  //   return json.data() as Map<String ,dynamic>;
  // }
  @override
  Future<dynamic> getData({required String path, String? documentId}) async {
    if (documentId != null) {
      var json = await firestore.collection(path).doc(documentId).get();
      return json.data() as Map<String, dynamic>;
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getStremData({
    required String path,
    required String userId,
  }) async* {
    var data = firestore.collection(path).doc(userId).collection('favorites');

    await for (var result in data.snapshots()) {
      yield result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<void> addFavoriteData({
    required String path,
    required String userId,
    required String productId,
    required Map<String, dynamic> data,
  }) async {
    await firestore
        .collection(path)
        .doc(userId)
        .collection('favorites')
        .doc(productId)
        .set(data);
  }

  @override
  Future<void> deleteData({
    required String path,
    required String userId,
    required String productId,
  }) async {
    await firestore
        .collection(path)
        .doc(userId)
        .collection('favorites')
        .doc(productId)
        .delete();
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> json,
    String? documentId,
  }) async {
    await firestore.collection(path).doc(documentId).update(json);
  }

  @override
  Future<void> addOrder({
    required String userId,
    required String orderPath,
    required Map<String, dynamic> orderData,
  }) async {
    final firestore = FirebaseFirestore.instance;

    final orderRef = firestore.collection(orderPath).doc(); // ID جديد

    final orderId = orderRef.id;

    final data = {
      ...orderData,
      'orderId': orderId,
      'userId': userId,
      'createdAt': FieldValue.serverTimestamp(),
    };
    log('$data');

    //  نستخدم batch عشان الاتنين يتحفظوا مع بعض
    WriteBatch batch = firestore.batch();

    // حفظ في collection العامة
    batch.set(orderRef, data);

    // حفظ داخل user subcollection
    final userOrderRef = firestore
        .collection('users')
        .doc(userId)
        .collection(orderPath)
        .doc(orderId);

    batch.set(userOrderRef, data);

    await batch.commit();
  }
}
