import 'package:flutter/material.dart';
import 'package:riverpod_http_test/Pages/get_page.dart';
import 'package:riverpod_http_test/Pages/post_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GetPage()));
            },
            child: Text("Try Get Request"),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PostPage()));
            },
            child: Text("Try Post Request"),
          )
        ],
      ),
    );
  }
}
