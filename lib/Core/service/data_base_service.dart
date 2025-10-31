
abstract class DataBaseService {
  Future<void> addUser({required String path ,required Map<String ,dynamic> json, String? documentId});
 // Future<Map<String ,dynamic>> getUser({required String path,required String documentId});
  Future<dynamic> getData({required String path, String? documentId});
}
