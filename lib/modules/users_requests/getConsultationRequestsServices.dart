import 'dart:convert';
import 'package:advisor_graduation_project/config/serverConfig.dart';
import 'package:advisor_graduation_project/model/getConsultationRequests.dart';
import 'package:http/http.dart' as http;

class GetConsultationRequestsServices {
  var message;

  Future<GetConsultationRequests> displayConsultationRequests(String token) async {
    var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.showConsultationRequests);
    try {
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // Parse response body safely
        final jsonResponse = jsonDecode(response.body);
        return GetConsultationRequests.fromJson(jsonResponse);
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception('Failed to load consultation requests');
      }
    } catch (e) {
      // Catch any exceptions thrown during the process
      print('Exception during request: $e');
      rethrow; // Rethrow the exception to be caught by the caller
    }
  }
}

