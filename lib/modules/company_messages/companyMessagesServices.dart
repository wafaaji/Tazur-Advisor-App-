import 'dart:convert';
import 'package:advisor_graduation_project/config/serverConfig.dart';
import 'package:advisor_graduation_project/model/companyMessages.dart';
import 'package:http/http.dart' as http;

class CompanyMessagesServices {

  Future<List<CompanyMessages>> displayCompanyMessages(String token, int companyId) async {
    try {
      var response = await http.get(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
            .companyMessages}/$companyId'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // Parse the JSON response
        List<dynamic> jsonResponse = json.decode(response.body);

        // Convert JSON to a list of companyMessages
        List<CompanyMessages> companyMessagesList = jsonResponse.map((data) => CompanyMessages.fromJson(data)).toList();

        return companyMessagesList;
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception('Failed to load company messages');
      }
    } catch (e) {
      // Catch any exceptions thrown during the process
      print('Exception during request: $e');
      rethrow; // Rethrow the exception to be caught by the caller
    }
  }
}

