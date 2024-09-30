import 'package:flutter/material.dart';

class Settingsrider extends StatefulWidget {
  const Settingsrider({Key? key}) : super(key: key);

  @override
  State<Settingsrider> createState() => _SettingsriderState();
}

class _SettingsriderState extends State<Settingsrider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  buildListTile(
                    leadingImage: 'Momo_images/solar_notification.png',
                    title: 'Notification Settings',
                    onTap: () {
                      Navigator.pushNamed(context, '/xxxxx');
                    },
                  ),
                  buildListTile(
                    leadingImage: 'Momo_images/ph_key.png',
                    title: 'Password Manager',
                    onTap: () {
                      Navigator.pushNamed(context, '/xxxxx');
                    },
                  ),
                  buildListTile(
                    leadingImage: 'Momo_images/ic_outline-delete.png',
                    title: 'Delete Account',
                    onTap: () {
                      Navigator.pushNamed(context, '/xxxxx');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Widget buildListTile({
    required String leadingImage,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Image.asset(leadingImage,
          width: 24,
          height: 24), // Set width and height to 24x24 pixels for consistency
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: Image.asset('Momo_images/fluent-arrow.png',
          width: 16, height: 16), // Set trailing arrow to a smaller size
      onTap: onTap,
    );
  }
}
