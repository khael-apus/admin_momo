import 'package:flutter/material.dart';

class Chatrider extends StatefulWidget {
  const Chatrider({super.key});

  @override
  State<Chatrider> createState() => _ChatriderState();
}

class _ChatriderState extends State<Chatrider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('Momo_images/back.png', height: 30, width: 30),
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'Momo_images/momowhite.png',
          height: 80,
          width: 200,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.green,
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "Chats",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/messengerrider',
                            arguments: "Juan Deck");
                      },
                      child: const ChatCard(
                        avatar: 'Momo_images/Juan Deck.png',
                        name: "Juan Deck",
                        message: "Good morning, did you sleep well?",
                        time: "Today",
                        notification: 1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/chatDetail',
                            arguments: "Juliet");
                      },
                      child: const ChatCard(
                        avatar: 'Momo_images/Juliet.png',
                        name: "Juliet",
                        message: "How is it going?",
                        time: "17/6",
                        notification: 0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/chatDetail',
                            arguments: "Romeo");
                      },
                      child: const ChatCard(
                        avatar: 'Momo_images/Romeo.png',
                        name: "Romeo",
                        message: "Aight, noted",
                        time: "17/6",
                        notification: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/riderHome');
            },
            child: Image.asset('Momo_images/home.png'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/listrider');
            },
            child: Image.asset('Momo_images/My list.png'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/chatrider');
            },
            child: Image.asset('Momo_images/chat.png'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/riderprofile');
            },
            child: Image.asset('Momo_images/profile.png'),
          ),
        ],
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.avatar,
    required this.name,
    required this.message,
    required this.time,
    required this.notification,
  });

  final String avatar;
  final String name;
  final String message;
  final String time;
  final int notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(avatar),
                radius: 25,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                if (notification > 0)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Text(
                      notification.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
