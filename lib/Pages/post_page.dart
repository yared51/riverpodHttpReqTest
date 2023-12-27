import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_test/DataProvider/data_provider.dart';
import 'package:riverpod_http_test/model/user_model.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(DataPostProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod Test Post"),
      ),
      body: _data.when(
          data: (_data) {
            return Column(
              children: [
                if (_data == 201) ...[
                  Card(
                    child: ListTile(
                      title: Text("The Post created Successfully "),
                    ),
                  )
                ] else ...[
                  Card(
                    child: ListTile(
                      title: Text("The Post Couldn't created  "),
                    ),
                  )
                ]
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
