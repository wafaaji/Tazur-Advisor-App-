import 'dart:convert';
import 'package:advisor_graduation_project/config/serverConfig.dart';
import 'package:advisor_graduation_project/model/companyProfile.dart';
import 'package:http/http.dart' as http;

class CompanyProfileService {

  Future<CompanyProfile> displayCompanyProfile(String token, int companyId) async {
    try {
      var response = await http.get(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
            .companyProfile}/$companyId'),
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
        return CompanyProfile.fromJson(jsonResponse);
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception('Failed to load company profile');
      }
    } catch (e) {
      // Catch any exceptions thrown during the process
      print('Exception during request: $e');
      rethrow; // Rethrow the exception to be caught by the caller
    }
  }
}

