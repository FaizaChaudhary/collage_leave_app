import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'leave_send.dart';

class TeacherSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Teacher"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('admins').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data.docs[index]['name']),
                  subtitle: Text(snapshot.data.docs[index]['mail']),
                  onTap: () {
                    // Navigate to LeaveSend with selected teacher's ID
                    Get.to(() => LeaveSend(teacherId: snapshot.data.docs[index].id));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading teachers"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
