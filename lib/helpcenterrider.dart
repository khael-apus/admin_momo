import 'package:flutter/material.dart';

class Helpcenterrider extends StatefulWidget {
  const Helpcenterrider({super.key});

  @override
  State<Helpcenterrider> createState() => _HelpcenterriderState();
}

class _HelpcenterriderState extends State<Helpcenterrider>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  '                  Help Center',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'Momo_images/Vector.png',
                      width: 20,
                      height: 20,
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'FAQ'),
                    Tab(text: 'Contact US'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                FAQTabContent(),
                ContactUsTabContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FAQTabContent extends StatelessWidget {
  const FAQTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('FAQ content'),
    );
  }
}

class ContactUsTabContent extends StatelessWidget {
  const ContactUsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Contact US content'),
    );
  }
}
