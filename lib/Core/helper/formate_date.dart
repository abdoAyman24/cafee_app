import 'package:caffee/constance.dart';
import 'package:intl/intl.dart';

({String date, String time}) FormateDate({required String inputeDate}) {
  //Formate This Date "16 February 2026 at 16:14:46 UTC+2" to (Time=16:14:46 , Date=2026-02-16)
  String input = '16 February 2026 at 16:14:46 UTC+2';

  // نشيل كلمة "at"
  input = input.replaceAll(' at ', ' ');

  // نعمل parsing
  DateTime dateTime = DateFormat(
    "d MMMM yyyy HH:mm:ss 'UTC'Z",
    KLanguage,
  ).parseUtc(input);

  // نرجعه للـ local لو محتاج
  dateTime = dateTime.toLocal();

  // التاريخ فقط
  String date = DateFormat('d MMMM yyyy', KLanguage).format(dateTime);

  // الوقت فقط
  String time = DateFormat('HH:mm:ss').format(dateTime);

  return (date: date, time: time);
}
