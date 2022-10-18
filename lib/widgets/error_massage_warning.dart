import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Message {
  static void taskErrorOnWarning(String taskName, String taskError) {
    Get.snackbar(taskName, taskError,
        backgroundColor: Colors.red,
        titleText: Text(taskName,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        messageText: Text(taskError, style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white
        )));
  }
}
