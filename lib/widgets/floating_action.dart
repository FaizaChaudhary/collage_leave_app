import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screens/annocement_send.dart';

import '../Screens/leave_send.dart';
import '../Screens/TeacherSelectionScreen.dart';

class student_floating_action extends StatelessWidget {
  final bool usertype;
  const student_floating_action({super.key, required this.usertype});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.to(() => TeacherSelectionScreen());
      },
      child: const Icon(
        Icons.add,
        color: Colors.red,
      ),
    );
  }
}