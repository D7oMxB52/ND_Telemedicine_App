// import 'dart:convert';
//
// MyBooking myBookingJson(String str) => MyBooking.fromJson(json.decode(str));
//
// String myBookingToJson(MyBooking data) => json.encode(data.toJson());
//
// class MyBooking {
//   int id;
//   String patientName;
//   String doctorName;
//   String date;
//   String time;
//   String chatLink;
//   bool hasPaid;
//   bool hasConfirmed;
//
//   MyBooking({this.id, this.patientName, this.doctorName, this.date, this.time, this.chatlink, this.hasPaid, this.hasConfirmed});
//   factory MyBooking.fromJson(Map<String, dynamic> json) => MyBooking(
//     patientName: json["patientName"],
//     doctorName: json["doctorName"],
//     date: json["date"],
//     time: json["time"],
//     chatlink: json["chatLink"],
//     hasPaid: json["hasPaid"],
//     hasConfirmed: json["hasConfirmed"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "patientName": patientName,
//     "doctorName": doctorName,
//     "date": date,
//     "time": time,
//     "chatlink": chatLink,
//     "hasPaid": hasPaid,
//     "hasConfirmed": hasConfirmed,
//   };
//
//   int get id => id;
//   String get patientName => patientName;
//   String get doctorName => doctorName;
//   String get date => date;
//   String get time => time;
//   String get chatLink => chatLink;
//   bool get hasPaid => hasPaid;
//   bool get hasConfirmed => hasConfirmed;
//
// }