import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_test/DataProvider/data_provider.dart';
import 'package:riverpod_http_test/model/user_model.dart';

class GetPage extends ConsumerWidget {
  const GetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(UserDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod Test"),
      ),
      body: _data.when(
          data: (_data) {
            List<UserModel> userList = _data.map((e) => e).toList();
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (_, index) {
                          return Card(
                            child: ListTile(
                              title: Text(userList[index].name),
                              subtitle: Text(userList[index].email),
                            ),
                          );
                        }))
              ],
            );
          },
          error: (er, s) => Text(er.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
