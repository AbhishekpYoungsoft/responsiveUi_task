// ignore_for_file: unused_label

import 'dart:convert';

PatientModel detailsModelFromJson(String str) =>
    PatientModel.fromJson(json.decode(str));

class PatientModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? purpose;
  PatientHeight? patientHeight;
  String? dateOfBirth;
  int? weight;
  String? gender;
  String? birthSex;
  int? careEpisodeId;
  String? timezone;
  String? clinicId;
  bool? isRecieveEmailNotification;

  PatientModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.purpose,
      this.patientHeight,
      this.dateOfBirth,
      this.weight,
      this.gender,
      this.birthSex,
      this.careEpisodeId,
      this.timezone,
      this.clinicId,
      this.isRecieveEmailNotification});

  PatientModel.fromJson(Map<String?, dynamic> json) {
    id:
    json['id'];
    firstName:
    json['firstName'];
    lastName:
    json['lastName'];
    email:
    json['email'];
    purpose:
    json['purpose'];
    patientHeight:
    json['patientHeight'] != null
        ? PatientHeight.fromJson(json['patientHeight'])
        : null;
    dateOfBirth:
    json['dateOfBirth'];
    weight:
    json['weight'];
    gender = json['gender'];
    birthSex:
    json['birthSex'];
    careEpisodeId:
    json['careEpisodeId'];
    timezone:
    json['timezone'];
    clinicId:
    json['clinicId'];
    isRecieveEmailNotification:
    json['isRecieveEmailNotification'];
  }

  Map<String?, dynamic> toJson() => {
        //final Map<String?, dynamic> data = new Map<String, dynamic>();
        "id": id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'purpose': purpose,
        'patientHeight': patientHeight!.toJson(),
        'dateOfBirth': dateOfBirth,
        'weight': weight,
        'gender': gender,
        'birthSex': birthSex,
        'careEpisodeId': careEpisodeId,
        'timezone': timezone,
        'clinicId': clinicId,
        'isRecieveEmailNotification': isRecieveEmailNotification
        // return data;
      };
}

class PatientHeight {
  int? feet;
  int? inch;

  PatientHeight({this.feet, this.inch});

  PatientHeight.fromJson(Map<String, dynamic> json) {
    feet = json['feet'];
    inch = json['inch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['feet'] = feet;
    data['inch'] = inch;
    return data;
  }
}
