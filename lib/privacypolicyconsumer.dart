import 'package:flutter/material.dart';

class Privacypolicyconsumer extends StatefulWidget {
  const Privacypolicyconsumer({Key? key}) : super(key: key);

  @override
  State<Privacypolicyconsumer> createState() => _PrivacypolicyconsumerState();
}

class _PrivacypolicyconsumerState extends State<Privacypolicyconsumer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'Momo_images/back.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              '                  Privacy Policy',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Contact Us Link
            GestureDetector(
              onTap: () {
                // Implement functionality for Contact Us link
              },
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 300),
            // Terms and Conditions Link
            GestureDetector(
              onTap: () {
                // Implement functionality for Terms and Conditions link
              },
              child: Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
