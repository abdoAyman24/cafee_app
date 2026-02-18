import 'package:intl/intl.dart';
  
({String date, String time}) FormateDate({required String inputeDate}) {
  
  //Formate This Date "16 February 2026 at 16:14:46 UTC+2" to (Time=16:14:46 , Date=2026-02-16)
  String input = inputeDate;

  // نحذف كلمة "at" 
  input = input.replaceAll(" at ", " ");

  DateTime dateTime = DateFormat(
    "d MMMM yyyy HH:mm:ss 'UTC'Z",
  ).parse(input, true);

  // التاريخ فقط
  String date =DateFormat('d MMMM yyyy', 'en').format(dateTime);

  // الوقت فقط
  String time = DateFormat("HH:mm:ss").format(dateTime);

 // date=16 February 2026 
 // time= 16:14:46

  return (date:date ,time:time);
}
