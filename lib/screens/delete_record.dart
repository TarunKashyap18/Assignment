import 'package:flutter/material.dart';

import '../util/database_helper.dart';

class DeleteRecord extends StatelessWidget {
  DeleteRecord({Key? key}) : super(key: key);

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
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          _handelSubmit(_nameController.text);
                          _nameController.clear();
                        },
                        child: const Text("Submit")))
              ],
            ),
          ),
        ));
  }

  void _handelSubmit(String name) async {
    int deleteStudentId = await db.deleteStudent(name);
    print("delete id : " + deleteStudentId.toString());
  }
}
