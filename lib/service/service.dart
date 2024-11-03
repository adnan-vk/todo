import 'package:dio/dio.dart';
import 'package:todo/model/model.dart';

class TodoService {
  Dio dio = Dio();
  var endpointUrl = 'https://659fbae85023b02bfe8a5161.mockapi.io/user';
  // final endpointUrl =
  //     "https://attendx.kodlar.in/api/admin/institutions/67062e77c6ca74cd3a4aa8c6/students";

  Future<List<TodoModel>> getData() async {
    try {
      Response response = await dio.get(endpointUrl);
      if (response.statusCode == 200) {
        var jsonList = response.data as List;
        List<TodoModel> data = jsonList.map((json) {
          return TodoModel.fromJson(json);
        }).toList();
        return data;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  createdata(TodoModel value) async {
    try {
      await dio.post(endpointUrl, data: value.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  deletedata({required id}) async {
    try {
      await dio.delete('$endpointUrl/$id');
    } catch (e) {
      rethrow;
    }
  }

  edittodo(TodoModel value, String id) async {
    try {
      await dio.put('$endpointUrl/$id', data: value.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
