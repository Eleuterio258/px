import 'package:delivery/Utils/dio_helper.dart';
import 'package:delivery/models/user.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final dio = Dio();
  void login(String email, String password) async {
    DioHelper.postData(url: 'null', data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      var user = User.fromJson(value.data);
      return user.name.toString();
    }).catchError((error) {
      print(error.toString());
      return 'Failed to login ';
    });
  }

  void register(String email, String password) async {
    DioHelper.postData(url: 'null', data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      var user = User.fromJson(value.data);
      return user.name.toString();
    }).catchError((error) {
      print(error.toString());
      return 'Failed to register ';
    });
  }

  Future<User> authentication(String email, String password) async {
    Map<String, dynamic> userDetails = {'email': email, 'password': password};

    var formData = FormData.fromMap(userDetails);
    try {
      final response = await dio.post('urlLogin', data: formData);

      return User.fromJson(response.data);
    } on DioError catch (dioError) {
      return dioError.response.data;
    } catch (e) {
      return null;
    }
  }

Future<User> regitration(String email, String password) async {
    Map<String, dynamic> userDetails = {'email': email, 'password': password};

    var formData = FormData.fromMap(userDetails);
    try {
      final response = await dio.post('urlLogin', data: formData);

      return User.fromJson(response.data);
    } on DioError catch (dioError) {
      return dioError.response.data;
    } catch (e) {
      return null;
    }
  }

}
