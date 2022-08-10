import 'package:clean_arq/ui/features/no_realtime/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/domain.dart';

class ListScreenNoRealtimeScreen extends StatelessWidget {
  const ListScreenNoRealtimeScreen._();
  static Widget init() {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) {
        return ListScreenNoRealtimeProvider(
          userRepository: context.read<UserRepository>(),
        )..load();
      },
      child: const ListScreenNoRealtimeScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ListScreenNoRealtimeProvider>();
    final users = provider.users;

    return Scaffold(
      appBar: AppBar(),
      body: users == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final User user = users[index];
                return ListTile(
                  title: Text('${user.firstname} ${user.lastname}'),
                  subtitle: Text(user.gender),
                  onTap: () {},
                );
              },
            ),
    );
  }
}
