import 'dart:convert';
import 'package:advisor_graduation_project/config/serverConfig.dart';
import 'package:advisor_graduation_project/model/loginModel.dart';
import 'package:advisor_graduation_project/native-services/secureStorage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginService {

  var message;
  var token;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);

  Future<bool> login(LoginModel login) async{
    print("Email: ${login.email}");
    print("Password: ${login.password}");
    var response = await http.post(
      url,
      headers: {
        'Accept' : 'application/json',
      },
      body: {
        "email" : login.email,
        "password" : login.password,
      },
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      //take json and make it var
      var jsonResponse = jsonDecode(response.body);
      message = 'login successfully'.tr;
      token = jsonResponse["token"];
      print('-----------------------------------------------------------------');
      SecureStorage storage = SecureStorage();
      await storage.save("token", token);
      print('------service------' + message + token);
      return true;
    }else if (response.statusCode == 400){
      message = 'login email error'.tr;
      return false;
    }else if (response.statusCode == 402){
      message = 'login password error'.tr;
      return false;
    }else{
      message = 'server error'.tr;
      return false;
    }

  }

}