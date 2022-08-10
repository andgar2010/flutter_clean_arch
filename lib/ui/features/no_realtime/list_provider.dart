import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class ListScreenNoRealtimeProvider extends ChangeNotifier {
  ListScreenNoRealtimeProvider({required this.userRepository});
  final UserRepository userRepository;

  List<User>? users;

  Future<void> load() async {
    users = await userRepository.getUsers();
    notifyListeners();
  }
}
