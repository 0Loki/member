import 'package:flutter/material.dart';

enum Jobs {
  Engineer(
      title: "วิศวกร", image: "assets/Image/pic1.jpg", color: Colors.orange),
  Doctor(title: "หมอ", image: "assets/Image/pic2.png", color: Colors.blue),
  Teacher(title: "ครู", image: "assets/Image/pic3.jpg", color: Colors.green);

  const Jobs({required this.title, required this.image, required this.color});
  final String title;
  final String image;
  final Color color;

  static Jobs fromString(String jobString) {
    switch (jobString) {
      case "หมอ":
        return Jobs.Doctor;
      case "วิศวกร":
        return Jobs.Engineer;
      case "ครู":
        return Jobs.Teacher;
      default:
        throw Exception('Job not found: $jobString');
    }
  }
}

class Person {
  final String name;
  final String age;
  final Jobs job;
  //final String image;

  Person({
    required this.name,
    required this.age,
    required this.job,
    //required this.image,
  });

  //แปลงข้อมูล Person เป็น json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Age': age,
      'Job': job.name, // ส่งชื่อ job กลับในรูปแบบ string
      'Image': job.image,
    };
  }

  //แปลงจาก json เป็น person
  factory Person.fromJson(Map<String, dynamic> json) {
    print('Converting JSON: $json');
    return Person(
      name: json['Name'],
      age: json['Age'],
      job: Jobs.fromString(json['Job']),
      //image: json['Image'],
    );
  }
  String get image => job.image;
}
