import 'package:flutter/material.dart';
import '../settings/colors.dart';
import '../applications/applications.dart';
import '../functions/leave_send_func.dart';

class LeaveSend extends StatefulWidget {
  final String teacherId; // Add this to accept the teacherId

  const LeaveSend({super.key, required this.teacherId});

  @override
  State<LeaveSend> createState() => _LeaveSendState();
}

class _LeaveSendState extends State<LeaveSend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_Colors.appbar_color,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Applications.application.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      // Pass the selected leave reason and teacherId to the function
                      date_select(
                        context,
                        Applications.application[index].toString(),
                        widget.teacherId, // Pass the teacherId here
                      );
                    },
                    title: Text(
                      Applications.application[index],
                    ),
                    trailing: const Icon(
                      Icons.forward_to_inbox_outlined,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}