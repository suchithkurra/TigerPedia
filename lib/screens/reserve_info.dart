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
        backgroundColor: Color(0xFFFFF8F4),
      ),
      body: Container(
        color: Color(0xFFFFF8F4),
        child: SingleChildScrollView(

          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reserve Name: ${reserve.tigerReserve}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('State: ${reserve.state}', style: TextStyle(fontSize: 20),),
              Text('Tiger Count (2023): ${reserve.tigerCount2023}', style: TextStyle(fontSize: 20),),
              Text('Ecotourism Resorts: ${reserve.ecotourismResorts}', style: TextStyle(fontSize: 20),),
              Text('PA Notification Year: ${reserve.paNotificationYear ?? "N/A"}', style: TextStyle(fontSize: 20),),
              Text('TR Notification Year: ${reserve.TRNotificationYear}', style: TextStyle(fontSize: 20),),
              Text('Core Area (sqkm): ${reserve.coreAreaSqkm}', style: TextStyle(fontSize: 20),),
              Text('Buffer Area (sqkm): ${reserve.bufferAreaSqkm}', style: TextStyle(fontSize: 20),),
              Text('Total Area (sqkm): ${reserve.totalAreaSqkm}', style: TextStyle(fontSize: 20),),
              Text('reserve website: ${reserve.reserve_website}', style: TextStyle(fontSize: 20),),
              Text('resrve image: ${reserve.reserve_image}', style: TextStyle(fontSize: 20),),
              Text('ecotourism): ${reserve.ecotourism_link}', style: TextStyle(fontSize: 20),),

            ],
          ),
        ),
      ),
    );
  }
}
