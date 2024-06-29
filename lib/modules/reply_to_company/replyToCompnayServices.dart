import 'dart:convert';
import 'package:advisor_graduation_project/config/serverConfig.dart';
import 'package:advisor_graduation_project/model/replyToCompany.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReplyToCompanyServices {
  var message;

  Future<bool> replyToCompany(var token, ReplyToCompanyModel replyToCompany, int requestId) async {

    print('Reply: ${replyToCompany.reply}');

    var response = await http.post(
      Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
          .replyToCompany}/$requestId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(replyToCompany.toJson()),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      // Parse JSON
      var jsonResponse = jsonDecode(response.body);
      // Handle response
      message = 'replay successfully'.tr;
      print(
          '-----------------------------------------------------------------');
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }
}