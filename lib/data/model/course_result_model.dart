import 'package:flutter/foundation.dart';



class Course {
  int id;
  String title;
  List<String> img;
  String interest;
  int price;
  String date;
  String address;
  String trainerName;
  String trainerImg;
  String trainerInfo;
  String occasionDetail;
  String latitude;
  String longitude;
  bool isLiked;
  bool isSold;
  bool isPrivateEvent;
  bool hiddenCashPayment;
  int specialForm;
  Null questionnaire;
  Null questExplanation;
  List<ReservTypes> reservTypes;
  // QuestionnaireFields questionnaireFields;
  // List<OccasionAgenda> occasionAgenda;

  Course(
      {this.id,
      this.title,
      // this.img,
      this.interest,
      this.price,
      this.date,
      this.address,
      this.trainerName,
      this.trainerImg,
      this.trainerInfo,
      this.occasionDetail,
      this.latitude,
      this.longitude,
      this.isLiked,
      this.isSold,
      this.isPrivateEvent,
      this.hiddenCashPayment,
      this.specialForm,
      this.questionnaire,
      this.questExplanation,
      this.reservTypes,
      // this.questionnaireFields,
      // this.occasionAgenda
      });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'].cast<String>();
    interest = json['interest'];
    price = json['price'];
    date = json['date'];
    address = json['address'];
    trainerName = json['trainerName'];
    trainerImg = json['trainerImg'];
    trainerInfo = json['trainerInfo'];
    occasionDetail = json['occasionDetail'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isLiked = json['isLiked'];
    isSold = json['isSold'];
    isPrivateEvent = json['isPrivateEvent'];
    hiddenCashPayment = json['hiddenCashPayment'];
    specialForm = json['specialForm'];
    questionnaire = json['questionnaire'];
    questExplanation = json['questExplanation'];
    if (json['reservTypes'] != null) {
      reservTypes = new List<ReservTypes>();
      json['reservTypes'].forEach((v) {
        reservTypes.add(new ReservTypes.fromJson(v));
      });
    }
    // questionnaireFields = json['questionnaireFields'];
    // if (json['occasionAgenda'] != null) {
    //   occasionAgenda = new List<OccasionAgenda>();
    //   json['occasionAgenda'].forEach((v) {
    //     occasionAgenda.add(OccasionAgenda.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img'] = this.img;
    data['interest'] = this.interest;
    data['price'] = this.price;
    data['date'] = this.date;
    data['address'] = this.address;
    data['trainerName'] = this.trainerName;
    data['trainerImg'] = this.trainerImg;
    data['trainerInfo'] = this.trainerInfo;
    data['occasionDetail'] = this.occasionDetail;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isLiked'] = this.isLiked;
    data['isSold'] = this.isSold;
    data['isPrivateEvent'] = this.isPrivateEvent;
    data['hiddenCashPayment'] = this.hiddenCashPayment;
    data['specialForm'] = this.specialForm;
    data['questionnaire'] = this.questionnaire;
    data['questExplanation'] = this.questExplanation;
    if (this.reservTypes != null) {
      data['reservTypes'] = this.reservTypes.map((v) => v.toJson()).toList();
    }
    // data['questionnaireFields'] = this.questionnaireFields;
    // if (this.occasionAgenda != null) {
    //   data['occasionAgenda'] = this.occasionAgenda.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ReservTypes {
  int id;
  String name;
  int count;
  int price;

  ReservTypes({this.id, this.name, this.count, this.price});

  ReservTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['count'] = this.count;
    data['price'] = this.price;
    return data;
  }
}
// class Course {
//   final int id;
//    String title;
//   // List<String> img;
//   String interest;
//   int price;
//   String date;
//   String address;
//   String trainerName;
//   String trainerImg;
//   String trainerInfo;
//   String occasionDetail;
//   String latitude;
//   String longitude;
//   bool isLiked;
//   bool isSold;
//   bool isPrivateEvent;
//   bool hiddenCashPayment;
//   int specialForm;
//   String questionnaire;
//   String questExplanation;
//   // List<ReservTypes> reservTypes;
//   // QuestionnaireFields questionnaireFields;
//   // List<OccasionAgenda> occasionAgenda;

//   Course({
//     @required this.id,
//     @required this.title,
//     // this.img,
//     this.interest,
//     this.price,
//     this.date,
//     this.address,
//     this.trainerName,
//     this.trainerImg,
//     this.trainerInfo,
//     this.occasionDetail,
//     this.latitude,
//     this.longitude,
//     this.isLiked,
//     this.isSold,
//     this.isPrivateEvent,
//     this.hiddenCashPayment,
//     this.specialForm,
//     this.questionnaire,
//     this.questExplanation,
//   });

//   factory Course.fromJson(Map<String, dynamic> json) {
//     return Course(
//       id: json['id'] as int,
//       title: json['title'] as String,
//       // img = json['img'].cast<String>();
//       interest: json['interest'],
//       price: json['price'],
//       date: json['date'],
//       address: json['address'],
//       trainerName: json['trainerName'],
//       trainerImg: json['trainerImg'],
//       trainerInfo: json['trainerInfo'],
//       occasionDetail: json['occasionDetail'],
//       latitude: json['latitude'],
//       longitude: json['longitude'],
//       isLiked: json['isLiked'],
//       isSold: json['isSold'],
//       isPrivateEvent: json['isPrivateEvent'],
//       hiddenCashPayment: json['hiddenCashPayment'],
//       specialForm: json['specialForm'],
//     );

//     // questionnaire = json['questionnaire'];
//     // questExplanation = json['questExplanation'];
//     // if (json['reservTypes'] != null) {
//     //   reservTypes = new List<ReservTypes>();
//     //   json['reservTypes'].forEach((v) {
//     //     reservTypes.add(new ReservTypes.fromJson(v));
//     //   });
//     // }
//     // questionnaireFields = json['questionnaireFields'];
//     // if (json['occasionAgenda'] != null) {
//     //   occasionAgenda = new List<Null>();
//     //   json['occasionAgenda'].forEach((v) {
//     //     occasionAgenda.add(new OccasionAgenda.fromJson(v));
//     //   });
//     // }

//     // Map<String, dynamic> toJson() {
//     //   final Map<String, dynamic> data = new Map<String, dynamic>();

//     //   data['id'] = this.id;
//     //   data['title'] = this.title;
//     //   // data['img'] = this.img;
//     //   data['interest'] = this.interest;
//     //   data['price'] = this.price;
//     //   data['date'] = this.date;
//     //   data['address'] = this.address;
//     //   data['trainerName'] = this.trainerName;
//     //   data['trainerImg'] = this.trainerImg;
//     //   data['trainerInfo'] = this.trainerInfo;
//     //   data['occasionDetail'] = this.occasionDetail;
//     //   data['latitude'] = this.latitude;
//     //   data['longitude'] = this.longitude;
//     //   data['isLiked'] = this.isLiked;
//     //   data['isSold'] = this.isSold;
//     //   data['isPrivateEvent'] = this.isPrivateEvent;
//     //   data['hiddenCashPayment'] = this.hiddenCashPayment;
//     //   data['specialForm'] = this.specialForm;
//     //   data['questionnaire'] = this.questionnaire;
//     //   data['questExplanation'] = this.questExplanation;
//     //   // if (this.reservTypes != null) {
//     //   //   data['reservTypes'] = this.reservTypes.map((v) => v.toJson()).toList();
//     //   // }
//     //   // data['questionnaireFields'] = this.questionnaireFields;
//     //   // if (this.occasionAgenda != null) {
//     //   //   data['occasionAgenda'] =
//     //   //       this.occasionAgenda.map((v) => v.toJson()).toList();
//     //   // }
//     //   return data;
//     // }
//   }
// @override
//   String toString() {
//     return '{ ${this.title}, }';
//   }
// }

// class ReservTypes {
//   int id;
//   String name;
//   int count;
//   int price;

//   ReservTypes({this.id, this.name, this.count, this.price});

//   ReservTypes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     count = json['count'];
//     price = json['price'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['count'] = this.count;
//     data['price'] = this.price;
//     return data;
//   }
// }
// class QuestionnaireFields {
//  QuestionnaireFields.fromJson(Map<String, dynamic> json) {

//   }

//   Map<String, dynamic> toJson() {

//   }
// }
// class OccasionAgenda {
// OccasionAgenda.fromJson(Map<String, dynamic> json) {

//   }

//   Map<String, dynamic> toJson() {

//   }
// }
