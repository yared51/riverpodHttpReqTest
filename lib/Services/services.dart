import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_http_test/model/user_model.dart';

class ApiServices {
  String getApiendpoint = "https://jsonplaceholder.typicode.com/users";
  String postApiendpoint = "https://jsonplaceholder.typicode.com/posts";
  getUser() async {
    Response response = await get(Uri.parse(getApiendpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception("<ApiServices>${response.reasonPhrase}");
    }
  }

  PostPosts() async {
    var data = {
      "userId": "1",
      "id": "1",
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    };
    Response response = await post(Uri.parse(postApiendpoint), body: data);

    return response.statusCode;
  }
}

final serviceProvider = Provider<ApiServices>((ref) => ApiServices());
