import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/repository/auth_repositories.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return AuthNotifier(repo);
});

class AuthNotifier extends StateNotifier<bool> {
  final AuthRepository _repo;
  AuthNotifier(this._repo) : super(false);

  Future<bool> login(String userName, String password) async {
    final token = await _repo.login(userName, password);
    state = token != null;
    return state;
  }

  Future<bool> register(String userName, String email, String password) async {
    return await _repo.register(userName, email, password);
  }
}
