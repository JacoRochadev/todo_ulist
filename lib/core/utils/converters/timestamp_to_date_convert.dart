import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TimestampToDateConvert {
  String call(Timestamp timestamp) {
    final dateTime = timestamp.toDate();
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }
}
