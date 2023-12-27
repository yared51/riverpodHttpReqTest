import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_test/Services/services.dart';
import 'package:riverpod_http_test/model/user_model.dart';

final UserDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(serviceProvider).getUser();
});
final DataPostProvider = FutureProvider<String>((ref) async {
  return ref.watch(serviceProvider).PostPosts();
});
