import 'package:flutter/material.dart';

class RiderHome extends StatelessWidget {
  const RiderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Rider 12345',
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
                'Are you ready to work? Choose an order below.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            OrderCard(
              orderNumber: '123456',
              date: '25 - May - 2024, 1:00 PM',
              estimatedDelivery: 'Est. Delivery on 28, May',
              items: '4 items',
              price: '1165.00',
              imagePath: 'Momo_images/egg.png',
              onTap: () {
                Navigator.pushNamed(context, '/orderdetsrider');
              },
            ),
            const SizedBox(height: 16),
            OrderCard(
              orderNumber: '135790',
              date: '25 - May - 2024, 1:00PM',
              estimatedDelivery: 'Est. Delivery on 26, May',
              items: '5 items',
              price: '300.00',
              imagePath: 'Momo_images/bread.png',
              onTap: () {
                Navigator.pushNamed(context, '/XXXXXXXXXX');
              },
            ),
            const SizedBox(height: 16),
            OrderCard(
              orderNumber: '246810',
              date: '25 - May - 2024, 1:00 PM',
              estimatedDelivery: 'Est. Delivery on 26, May',
              items: '2 items',
              price: '180.00',
              imagePath: 'Momo_images/nestle.png',
              onTap: () {
                Navigator.pushNamed(context, '/XXXXXXXX');
              },
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

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String estimatedDelivery;
  final String items;
  final String price;
  final String imagePath;
  final VoidCallback onTap;

  const OrderCard({super.key, 
    required this.orderNumber,
    required this.date,
    required this.estimatedDelivery,
    required this.items,
    required this.price,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                height: 100,
                width: 100,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order No. $orderNumber',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      estimatedDelivery,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'P $price',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
