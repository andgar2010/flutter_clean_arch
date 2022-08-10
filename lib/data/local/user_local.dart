import '../../domain/domain.dart';

class UserLocal implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    final users = List.generate(
      20,
      (index) => User(
        firstname: 'Andres$index',
        lastname: 'Garcia$index',
        gender: 'M$index',
      )
    );
    return users;
  }
}
