import 'package:flutter/material.dart';
import '../services/api_service.dart';
class RegisterScreen extends StatefulWidget {
@override
_RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
final TextEditingController nameController =
TextEditingController();
final TextEditingController emailController =
TextEditingController();
final TextEditingController passwordController =
TextEditingController();
void registerUser() async {
String? message = await ApiService.registerUser(
nameController.text,
emailController.text,
passwordController.text,
);
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
Text(message ?? "Error")));
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Register")),
body: Padding(
padding: EdgeInsets.all(16.0),
child: Column(
children: [
TextField(controller: nameController, decoration:
InputDecoration(labelText: "Name")),
TextField(controller: emailController, decoration:
InputDecoration(labelText: "Email")),
TextField(controller: passwordController, decoration:
InputDecoration(labelText: "Password"), obscureText: true),
SizedBox(height: 20),
ElevatedButton(onPressed: registerUser, child:
Text("Register")),
],
),
),
);
}
}