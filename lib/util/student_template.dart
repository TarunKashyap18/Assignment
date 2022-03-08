import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  late String name;
  late String branch;
  late String gender;
  late String mobileNumber;
  Student({
    Key? key,
    required this.name,
    required this.branch,
    required this.gender,
    required this.mobileNumber,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Name: " + name),
          Text("Branch : " + branch),
          Text("Mobile No. : " + mobileNumber),
          Text("Gender : " + gender),
        ],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["branch"] = branch;
    map["mobileNumber"] = mobileNumber;
    map["gender"] = gender;

    return map;
  }

  Student.map(dynamic obj, {Key? key}) : super(key: key) {
    name = obj["name"];
    branch = obj["branch"];
    mobileNumber = obj["mobileNumber"];
    gender = obj["gender"];
  }
  Student.fromMap(Map<String, dynamic> map, {Key? key}) : super(key: key) {
    name = map["name"];
    branch = map["branch"];
    mobileNumber = map["mobileNumber"];
    gender = map["gender"];
  }
}
