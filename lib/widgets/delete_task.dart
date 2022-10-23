import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> delete(String taskId) async {
  await FirebaseFirestore.instance.collection('MyTodos').doc(taskId).delete();
}
