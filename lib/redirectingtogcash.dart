import 'package:flutter/material.dart';

class Redirectingtogcash extends StatelessWidget {
  const Redirectingtogcash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.white, // Set solid white background
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Center the content vertically
              children: [
                CircleAvatar(
                  radius:
                      200, // Increased the radius to make the picture bigger
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'Momo_images/gcash cat.png',
                    width:
                        500, // Increased the width to make the picture bigger
                    height:
                        300, // Increased the height to make the picture bigger
                  ),
                ),
                SizedBox(height: 10), // Space between the image and dots
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the dots
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 20), // Space between dots
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 20), // Space between dots
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 20), // Space between dots
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
