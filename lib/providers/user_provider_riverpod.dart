import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentUserProvider = StateNotifierProvider((ref) => UserProvider());

class UserProvider extends StateNotifier<String> {
  UserProvider() : super('123abc');

  void setUser(String user) {
    state = user;
  }
}
