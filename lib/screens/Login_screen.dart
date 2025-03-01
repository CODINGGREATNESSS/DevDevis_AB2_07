import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'home_screen.dart';
class LoginScreen extends StatefulWidget {
@override
_LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
void loginUser() async {
String? token = await ApiService.loginUser(
emailController.text,
passwordController.text,
);
if (token != null) {
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(token: token)));
} else {
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
}
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Login")),
body: Padding(
padding: EdgeInsets.all(16.0),
child: Column(
children: [
TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
SizedBox(height: 20),
ElevatedButton(onPressed: loginUser, child: Text("Login")),
],
),
),
);
}
}