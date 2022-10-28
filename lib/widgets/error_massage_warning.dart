import 'package:get/get.dart';
import 'package:flutter/material.dart';

//Template
abstract class Message {
  void taskErrorOnWarning(String taskName, String taskError) {
    Get.snackbar(taskName, taskError,
        backgroundColor: Colors.transparent,
        titleText: Text(taskName,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        messageText: Text(taskError,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }
}
