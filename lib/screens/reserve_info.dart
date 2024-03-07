import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/Models/reserve_data.dart';

class ReserveDetailScreen extends StatelessWidget {
  final TigerReserve reserve;

  ReserveDetailScreen({required this.reserve});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserve Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reserve Name: ${reserve.tigerReserve}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('State: ${reserve.state}'),
            Text('Tiger Count (2023): ${reserve.tigerCount2023}'),
            Text('Ecotourism Resorts: ${reserve.ecotourismResorts}'),
            Text('PA Notification Year: ${reserve.paNotificationYear ?? "N/A"}'),
            Text('TR Notification Year: ${reserve.TRNotificationYear}'),
            Text('Core Area (sqkm): ${reserve.coreAreaSqkm}'),
            Text('Buffer Area (sqkm): ${reserve.bufferAreaSqkm}'),
            Text('Total Area (sqkm): ${reserve.totalAreaSqkm}'),
          ],
        ),
      ),
    );
  }
}
