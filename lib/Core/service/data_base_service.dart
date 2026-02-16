abstract class DataBaseService {
  Future<void> addUser({
    required String path,
    required Map<String, dynamic> json,
    String? documentId,
  });
  // Future<Map<String ,dynamic>> getUser({required String path,required String documentId});
  Future<dynamic> getData({required String path, String? documentId});
  Future<void> addFavoriteData({
    required String path,
    required String userId,
    required String productId,
    required Map<String, dynamic> data,
  });
  Stream<List<Map<String, dynamic>>> getStremData({
    required String path,
    required String userId,
  });

  Future<void> deleteData({
    required String path,
    required String userId,
    required String productId,
  });

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> json,
    String? documentId,
  });
  Future<void> addOrder({
    required String userId,
    required String orderPath,

    required Map<String, dynamic> orderData,
  });
}
