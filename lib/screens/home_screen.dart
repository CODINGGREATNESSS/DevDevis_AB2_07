import 'package:flutter/material.dart';
import 'request_blood_screen.dart';
import 'sos_screen.dart';

class HomeScreen extends StatelessWidget {

String token = "your_dummy_token"; // Replace with your actual token or a dummy value
HomeScreen({required this.token});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Home")),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
onPressed: () {
Navigator.push(context, MaterialPageRoute(builder:
(context) => RequestBloodScreen(token: token)));
},
child: Text("Request Blood"),
),
ElevatedButton(
onPressed: () {
Navigator.push(context, MaterialPageRoute(builder:
(context) => SOSScreen(token: token)));
},
child: Text("Emergency SOS"),
),
],
),
),
);
}
}
