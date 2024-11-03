import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/model/model.dart';
import 'package:todo/service/service.dart';

class TodoProvider extends ChangeNotifier {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController insttituteIdcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TodoService todoservice = TodoService();
  List<TodoModel> notelist = [];

  void getTasks() async {
    try {
      notelist = await todoservice.getData();
      notifyListeners();
    } catch (e) {
      log("error in provider : $e");
    }
    notifyListeners();
  }

  createtodo() async {
    try {
      await todoservice.createdata(TodoModel(
        name: namecontroller.text,
        email: emailcontroller.text,
        instituteId: insttituteIdcontroller.text,
        phone: phonecontroller.text,
      ));
      getTasks();
    } catch (e) {
      return null;
    }
  }

  deletetodo(id) async {
    try {
      await todoservice.deletedata(id: id);
      getTasks();
    } catch (e) {
      return null;
    }
  }

  // edittodo(subject, content, id) async {
  //   try {
  //     await todoservice.edittodo(
  //         TodoModel(subject: subject, description: content), id);
  //     getTasks();
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
