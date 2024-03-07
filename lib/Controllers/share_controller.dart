import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';

class ShareHelper {
  static void shareWithFriends(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Share with Friends'),
          content: Text('Are you sure you want to share this content?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                _performShare(context);
              },
              child: Text('Share'),
            ),
          ],
        );
      },
    );
  }

  static void _performShare(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    const String text = 'Check out this awesome app!'; // Your share message

    // Share the content using the share plugin
    Share.share(
      text,
      subject: 'Share with Friends',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}
