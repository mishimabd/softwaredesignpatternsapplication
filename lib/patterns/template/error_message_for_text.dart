import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/error_massage_warning.dart';

class ErrorMforDetail extends Message {
  @override
  void taskErrorOnWarning(String taskName, String taskError) {
    Get.snackbar(taskName, taskError,
        backgroundColor: Colors.white,
        titleText: Text(taskName,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red)),
        messageText: Text(taskError,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red)));
  }
}
