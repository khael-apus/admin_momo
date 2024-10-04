import 'package:flutter/material.dart';

class Messengerrider extends StatefulWidget {
  const Messengerrider({super.key});

  @override
  State<Messengerrider> createState() => _MessengerriderState();
}

class _MessengerriderState extends State<Messengerrider> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momo Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Momo Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Image.asset(
              'Momo_images/momowhite.png', // Replace with your actual image path
              height: 30,
            ),
            const SizedBox(width: 10),
            const Text(
              'MOMO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              '• Online',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[300],
      ),
      body: Container(
        color: Colors.green[100],
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  // Displaying messages in a ListView.builder
                  // You can replace this with your message data
                  ChatMessage(
                    message:
                        'Good day ma\'am, walay egg diri na store, pwede sa lain store ko mag buy?',
                    isSent: false,
                  ),
                  ChatMessage(
                    message:
                        'Yes, Pwede ra kaayu sa lain store sir, paki add nalang kog chocolate sir...',
                    isSent: true,
                  ),
                  ChatMessage(
                    message: 'Cge po sir mag wait lang ko thanks!!',
                    isSent: true,
                  ),
                ],
              ),
            ),
            // Input field for sending messages
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display a single message
class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSent;

  const ChatMessage({super.key, required this.message, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (isSent) const SizedBox(width: 80),
          if (!isSent) const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSent ? Colors.green[300] : Colors.white,
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isSent ? Colors.white : Colors.black,
              ),
            ),
          ),
          if (isSent) const SizedBox(width: 20),
          if (!isSent) const SizedBox(width: 80),
        ],
      ),
    );
  }
}
