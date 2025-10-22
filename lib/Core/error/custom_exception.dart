
class CustomException implements Exception{
  final String error;

  CustomException({required this.error});
@override
  String toString() {
    // TODO: implement toString
    return error;
  }
 
}
