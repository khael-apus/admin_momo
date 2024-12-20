import 'package:flutter/material.dart';

class Rider extends StatefulWidget {
  const Rider({super.key});

  @override
  State<Rider> createState() => _RiderState();
}

class _RiderState extends State<Rider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'Momo_images/greenback.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Riders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'Momo_images/Search.png',
                    width: 24, // Adjust the width as needed
                    height: 24, // Adjust the height as needed
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'All users 2',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 2, // Number of riders
                itemBuilder: (context, index) {
                  return _buildRiderCard(
                    name: index == 0 ? 'Cholo Lot' : 'Lady Capulet',
                    email: index == 0
                        ? 'chololot@gmail.com'
                        : 'ladycapulet@gmail.com',
                    rating: index == 0 ? '4.5' : '4.8',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiderCard({
    required String name,
    required String email,
    required String rating,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: const Color.fromARGB(255, 54, 212, 152), // Set card color to green
      child: ListTile(
        title: Text(name),
        subtitle: Text(email),
        trailing: Text(rating),
        onTap: () {
          // Handle rider card tap
          _showRiderPopup(name, email, rating);
        },
      ),
    );
  }

  void _showRiderPopup(String name, String email, String rating) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rider Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name:$name'),
              Text('Email: $email'),
              Text('Rating: $rating'),
              const SizedBox(height: 10),
              const Text('Last Login: 20/12/2024 10:00am'),
              const Text('Last Logout: 20/12/2024 12:00pm'),
              const Text('Cancellation Record: 0'),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
