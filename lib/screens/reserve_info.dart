import 'package:flutter/material.dart';
import 'package:tigerapp/Controllers/reserve_info_controller.dart';
class ReserveInfoPage extends StatelessWidget {
  final TigerController _tigerController = TigerController(); // Creating an instance of TigerController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserve Info'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Call fetchTigersFromAPI() here
            try {
              final tigers = await _tigerController.fetchTigersFromAPI();
              // Handle the data received, e.g., navigate to another page, display in a list, etc.
              print(tigers); // Example: print the data to debug console
            } catch (e) {
              // Handle errors, e.g., display an error message
              print('Error fetching tiger data: $e');
            }
          },
          child: Text('Fetch Tiger Data'),
        ),
      ),
    );
  }
}
