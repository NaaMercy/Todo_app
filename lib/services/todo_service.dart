import 'dart:html';

import 'package:http/http.dart';

class TodoService {
  Future<Response> getAllTodoRequest() async {
    return await get(
        Uri.parse("https://cetacean-devolved.cyclic-app.com/todos"));
  }

  getTodoByIdRequest(String id) async {
    return await get(
        Uri.parse("https://cetacean-devolved.cyclic-app.com/todos/$id"));
  }

  createTodoRequest(
      {required String title,
      required String description,
      required String dateTime}) async {
    Map<String, String> body = {
      "title": title,
      "description": description,
      "date_time": dateTime
    };
    return await post(
        Uri.parse("https://cetacean-devolved.cyclic-app.com/todo"),
        body: body);
  }

  //update status of todo
  updateTodoRequest({required bool status, required String id}) async {
    Map<String, bool> body = {"status": status};

    return await patch(
        Uri.parse("https://cetacean-devolved.cyclic-app.com/todos/$id"),
        body: body);
  }

  //delete a todo
  deleteTodoRequest(String id) async {
    return await delete(
        (Uri.parse("https://cetacean-devolved.cyclic-app.com/todos/$id")));
  }
}
