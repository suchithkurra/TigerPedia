import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Privacy'),
          backgroundColor: const Color(0xFFFFF8F4)
      ),
      body: Container(
        color: const Color(0xFFFFF8F4),
        child: Padding(

          padding: const EdgeInsets.all(16.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Privacy Settings',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 20
                )
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              Text(
                'Manage your account privacy settings here.',
                style: GoogleFonts.poppins().copyWith(fontSize: 16),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              ListTile(
                title: Text('Public Profile'),
                subtitle: Text('Everyone can see your profile information.', style: GoogleFonts.poppins(),),
                trailing: Switch(
                  value: true, // Example value, replace with actual logic
                  onChanged: (newValue) {
                    // Handle switch state change
                  },
                ),
              ),
              ListTile(
                title: Text('Private Messages', style: GoogleFonts.poppins(),),
                subtitle: Text('Control who can send you private messages.' , style: GoogleFonts.poppins(),),
                trailing: Switch(
                  value: true, // Example value, replace with actual logic
                  onChanged: (newValue) {
                    // Handle switch state change
                  },
                ),
              ),
              // Add more settings as needed
            ],
          ),
        ),
      ),
    );
  }
}
