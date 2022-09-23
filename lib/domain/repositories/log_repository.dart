import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sigest/data/models/log_model/log_model.dart';

class LogRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  Future addActionLog({LogModel? log}) async {
    final user = _firebaseAuth.currentUser!.email;
    try {
      await _store
          .collection('$user-Log')
          .doc()
          .set(log!.toJson())
          .then((value) {});
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<LogModel?>> getActionsLog() async {
    final user = _firebaseAuth.currentUser!.email;
    List<LogModel?> logList = [];
    LogModel logModel;
    try {
      await _store
          .collection('$user-Log')
          .orderBy('date', descending: true)
          .get()
          .then((value) {
        for (var element in value.docs) {
          logModel = LogModel.fromJson(element.data());
          logList.add(logModel);
        }
      });

      return logList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
