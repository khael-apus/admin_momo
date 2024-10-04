import 'package:flutter/material.dart';

class ConsumerHome extends StatelessWidget {
  const ConsumerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('Momo_images/back.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Good morning,',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: Image.asset('Momo_images/Account.png'),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Juan D.',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '"Ready to restock? Whats on your grocery list today?"',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0), // Adjusted padding
                ),
                child: const Text(
                  '  + Create a New List         ',
                  style: TextStyle(fontSize: 40), // Set text size independently
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'My Lists',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'All',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Folder',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: Image.asset('Momo_images/No list.png'),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'No list yet. Create one now.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/consumerHome');
            },
            child: Image.asset('Momo_images/home.png'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/listconsumer');
            },
            child: Image.asset('Momo_images/My list.png'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/chatconsumer');
            },
            child: Image.asset('Momo_images/chat.png'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/consumerprofile');
            },
            child: Image.asset('Momo_images/profile.png'),
          ),
        ],
      ),
    );
  }
}
