import 'package:assignment/util/database_helper.dart';
import 'package:assignment/util/student_template.dart';
import 'package:flutter/material.dart';

class AddRecord extends StatefulWidget {
  AddRecord({Key? key}) : super(key: key);

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobile_numberController =
      TextEditingController();
  String _branchValue = 'Computer Science';
  String _genderValue = 'Male';

  var db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add news record "),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: "Name", hintText: "Tony Stank"),
                  keyboardType: TextInputType.name,
                ),
                DropdownButton<String>(
                  value: _branchValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _branchValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Computer Science',
                    'Mechanical',
                    'Electrical',
                    'Electronics'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextField(
                  controller: _mobile_numberController,
                  decoration: const InputDecoration(
                      labelText: "Mobile Nomber", hintText: "9999999999"),
                  keyboardType: TextInputType.number,
                ),
                DropdownButton<String>(
                  value: _genderValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _genderValue = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          _handelSubmit(_nameController.text, _branchValue,
                              _mobile_numberController.text, _genderValue);
                          _nameController.clear();
                          _mobile_numberController.clear();
                        },
                        child: const Text("Submit")))
              ],
            ),
          ),
        ));
  }

  void _handelSubmit(
      String name, String branch, String mobileNumber, String gender) async {
    Student stu = Student(
        name: name, branch: branch, gender: gender, mobileNumber: mobileNumber);
    int savedStudentId = await db.savedStudent(stu);

    print("Item saved id : $savedStudentId");
  }
}
