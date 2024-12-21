import 'package:flutter/material.dart';

class Admin_settings extends StatefulWidget {
  const Admin_settings({super.key});

  @override
  State<Admin_settings> createState() => _Admin_settingsState();
}

class _Admin_settingsState extends State<Admin_settings>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
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
          'Admin Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  Image.asset('Momo_images/profile.png', height: 60, width: 60),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(Icons.camera_alt,
                          color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'ADMIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  buildListTile(
                    leadingImage: 'Momo_images/User.png',
                    title: 'Edit Profile',
                    onTap: () {
                      Navigator.pushNamed(context, '/editprofilerider');
                    },
                  ),
                  buildListTile(
                    leadingImage: 'Momo_images/Place Marker.png',
                    title: 'Manage Address',
                    onTap: () {
                      Navigator.pushNamed(context, '/manageaddressrider');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile({
    required String leadingImage,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Image.asset(
        leadingImage,
        width: 30,
        height: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String estimatedDelivery;
  final String items;
  final String price;
  final String imagePath;

  const OrderCard({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.estimatedDelivery,
    required this.items,
    required this.price,
    required this.imagePath,
  });
 
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text('Order #$orderNumber'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: $date'),
            Text('Delivery: $estimatedDelivery'),
            Text('Items: $items'),
          ],
        ),
        trailing: Text(
          '₱$price',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
