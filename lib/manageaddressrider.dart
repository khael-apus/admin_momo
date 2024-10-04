import 'package:flutter/material.dart';

class Manageaddressrider extends StatefulWidget {
  const Manageaddressrider({super.key});

  @override
  State<Manageaddressrider> createState() => _ManageaddressriderState();
}

class _ManageaddressriderState extends State<Manageaddressrider> {
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Manage Address',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Address 1
                    ListTile(
                      leading: Image.asset('Momo_images/Place Marker.png'),
                      title: const Text('My Home'),
                      subtitle: const Text(
                          'Macanhan, Carmen, Cagayan de Oro, Misamis Oriental'),
                    ),
                    // Address 2
                    ListTile(
                      leading: Image.asset('Momo_images/Place Marker.png'),
                      title: const Text('Mom\'s Home'),
                      subtitle: const Text(
                          'Singapore, Balulang, Cagayan de Oro, Misamis Oriental'),
                    ),

                    const SizedBox(height: 40),
                    // Add New Address
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the next screen or perform other actions
                        // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 88, 218, 189),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('+ Add New Shipping Address'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Apply Button
          Container(
            padding: const EdgeInsets.all(5), // Add padding with a green color
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              onPressed: () {
                // Perform actions when the button is pressed
                Navigator.pop(
                    context); // This will pop the current screen and return to the previous screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 76, 175, 150),
                padding: const EdgeInsets.symmetric(
                  horizontal: 220,
                  vertical: 40,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
