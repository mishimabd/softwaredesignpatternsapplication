import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/error_massage_warning.dart';

class ErrorMforText extends Message {
  @override
  void taskErrorOnWarningDetails(String taskName, String taskError) {
    Get.snackbar(taskName, taskError,
        backgroundColor: Colors.red,
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
