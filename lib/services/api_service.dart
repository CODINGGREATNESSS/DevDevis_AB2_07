import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:5000/api";

  // User Registration
static Future<String?> registerUser(String name, String email,
String password) async {
final url = Uri.parse("$baseUrl/users/register");
final response = await http.post(
url,
headers: {"Content-Type": "application/json"},
body: jsonEncode({
"name": name,
"email": email,
"password": password,
}),
);
if (response.statusCode == 201) {
return "User registered successfully!";
} else {
return jsonDecode(response.body)["message"];
}
}

static Future<String?> loginUser(String email, String password)
async {
final url = Uri.parse("$baseUrl/users/login");
final response = await http.post(
url,
headers: {"Content-Type": "application/json"},
body: jsonEncode({
"email": email,
"password": password,
}),
);
if (response.statusCode == 200) {
final data = jsonDecode(response.body);
return data["token"]; // Return JWT token
} else {
return null;
}
}


  // Blood Request
  static Future<String?> requestBlood(String token, String bloodType, String location, String urgency) async {
    final url = Uri.parse("$baseUrl/requests/request");
    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "bloodType": bloodType,
        "location": location,
        "urgency": urgency,
      }),
    );
    if (response.statusCode == 201) {
      return "Blood request sent successfully!";
    } else {
      return "Failed to request blood.";
    }
  }
}