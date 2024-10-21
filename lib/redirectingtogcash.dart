import 'package:flutter/material.dart';

class Redirectingtogcash extends StatelessWidget {
  const Redirectingtogcash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          // Navigate to the named route when tapped
          Navigator.pushNamed(context,
              '/waitingconsumer'); // Ensure this route is defined in your app
        },
        child: Container(
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
                    'Momo_images/gcash cat.png', // Ensure this path is correct
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
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
