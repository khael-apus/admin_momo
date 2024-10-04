import 'package:flutter/material.dart';

class Privacypolicyrider extends StatefulWidget {
  const Privacypolicyrider({super.key});

  @override
  State<Privacypolicyrider> createState() => _PrivacypolicyriderState();
}

class _PrivacypolicyriderState extends State<Privacypolicyrider> {
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
            const SizedBox(height: 50),
            const Text(
              '                  Privacy Policy',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Contact Us Link
            GestureDetector(
              onTap: () {
                // Implement functionality for Contact Us link
              },
              child: const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 300),
            // Terms and Conditions Link
            GestureDetector(
              onTap: () {
                // Implement functionality for Terms and Conditions link
              },
              child: const Text(
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
