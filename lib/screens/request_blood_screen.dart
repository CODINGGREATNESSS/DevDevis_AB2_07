import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RequestBloodScreen extends StatefulWidget {
  final String token;
  RequestBloodScreen({required this.token});

  @override
  _RequestBloodScreenState createState() => _RequestBloodScreenState();
}

class _RequestBloodScreenState extends State<RequestBloodScreen> {
  final TextEditingController bloodTypeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController urgencyController = TextEditingController();

  void requestBlood() async {
    String? message = await ApiService.requestBlood(
      widget.token,
      bloodTypeController.text,
      locationController.text,
      urgencyController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message ?? "Error")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Request Blood")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: bloodTypeController, decoration: InputDecoration(labelText: "Blood Type")),
            TextField(controller: locationController, decoration: InputDecoration(labelText: "Location")),
            TextField(controller: urgencyController, decoration: InputDecoration(labelText: "Urgency")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: requestBlood, child: Text("Request Blood")),
          ],
        ),
      ),
    );
  }
}