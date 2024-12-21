import 'package:flutter/material.dart';

class Consumer extends StatefulWidget {
  const Consumer({super.key});

  @override
  State<Consumer> createState() => _ConsumerState();
}

class _ConsumerState extends State<Consumer> {
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
          'Consumer',
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
                    width: 24,
                    height: 24,
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
                    rating: index == 0 ? 4.5 : 4.8,
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
    required double rating,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: const Color.fromARGB(255, 54, 212, 152), // Set card color to green
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(email),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStars(rating),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                // Handle call action
              },
              icon: Image.asset(
                'Momo_images/call.png',
                width: 24,
                height: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                // Handle message action
              },
              icon: Image.asset(
                'Momo_images/mescah.png',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        onTap: () {
          _showRiderPopup(name, email, rating);
        },
      ),
    );
  }

  Widget _buildStars(double rating) {
    int fullStars = rating.floor();
    bool halfStar = (rating - fullStars) >= 0.5;
    return Row(
      children: List.generate(
        5,
        (index) {
          if (index < fullStars) {
            return Image.asset(
              'Momo_images/star.png',
              width: 24,
              height: 24,
            );
          } else if (index == fullStars && halfStar) {
            return Image.asset(
              'Momo_images/starnot.png',
              width: 24,
              height: 24,
            );
          } else {
            return Image.asset(
              'Momo_images/starnot.png',
              width: 24,
              height: 24,
            );
          }
        },
      ),
    );
  }

  void _showRiderPopup(String name, String email, double rating) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Consumer Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: $name'),
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
