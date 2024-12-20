import 'package:flutter/material.dart';

class Grocery_list extends StatefulWidget {
  const Grocery_list({super.key});

  @override
  State<Grocery_list> createState() => _Grocery_listState();
}

class _Grocery_listState extends State<Grocery_list>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Initialize TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController to free resources
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
          'Grocery List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: const [
                OrderCard(
                  orderNumber: '123456',
                  date: '25 - May - 2024, 1:00 PM',
                  estimatedDelivery: 'Est. Delivery on 28, May',
                  items: '4 items',
                  price: '1165.00',
                  imagePath: 'Momo_images/egg.png',
                ),
                OrderCard(
                  orderNumber: '789012',
                  date: '27 - May - 2024, 3:00 PM',
                  estimatedDelivery: 'Est. Delivery on 30, May',
                  items: '2 items',
                  price: '550.00',
                  imagePath: 'Momo_images/nestle.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder for OrderCard Widget
class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String estimatedDelivery;
  final String items;
  final String price;
  final String imagePath;

  const OrderCard({
    required this.orderNumber,
    required this.date,
    required this.estimatedDelivery,
    required this.items,
    required this.price,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text('Order #$orderNumber'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            Text(estimatedDelivery),
            Text(items),
          ],
        ),
        trailing: Text('₱$price'),
      ),
    );
  }
}
