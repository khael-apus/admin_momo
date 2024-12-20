import 'package:flutter/material.dart';

class Order_history extends StatefulWidget {
  const Order_history({super.key});

  @override
  State<Order_history> createState() => _Order_historyState();
}

class _Order_historyState extends State<Order_history>
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
          'Oder History & Reports',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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

  Widget _buildDashboardCard({
    required Widget child,
    required String label,
    required String routeName,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: const Color.fromARGB(255, 54, 212, 152),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Ensure you define the OrderCard widget.
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
