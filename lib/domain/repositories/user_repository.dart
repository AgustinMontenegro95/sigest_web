import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sigest/data/models/user_model/user_model.dart';

class UserRepository {
  Future<UserModel> getCurrentUser() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      UserModel user = const UserModel(
          name: 'name', uId: 'uId', email: 'email', image: 'image');

      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser!.uid)
          .get()
          .then((value) {
        user = UserModel.fromJson(value.data()!);
      });
      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
