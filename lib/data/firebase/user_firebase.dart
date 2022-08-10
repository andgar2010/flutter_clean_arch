import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/domain.dart';

class UserFirebase implements UserRepository {
  final usersRef = FirebaseFirestore.instance.collection('users').withConverter(
        fromFirestore: (
          DocumentSnapshot<Map<String, dynamic>> snapshots,
          SnapshotOptions? options,
        ) {
          return User.fromJson(snapshots.data()!);
        },
        toFirestore: (User users, SetOptions? options) => users.toJson(),
      );

  @override
  Future<List<User>> getUsers() async {
    final QuerySnapshot<User> querySnapshot = await usersRef.get();
    final users = querySnapshot.docs.map((QueryDocumentSnapshot<User> e) => e.data()).toList();
    return users;
  }
}
