import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Orderdetsrider(),
    );
  }
}

class Orderdetsrider extends StatefulWidget {
  const Orderdetsrider({Key? key}) : super(key: key);

  @override
  State<Orderdetsrider> createState() => _OrderdetsriderState();
}

class _OrderdetsriderState extends State<Orderdetsrider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Order Details',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Image.asset('Momo_images/back.png', height: 30, width: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: OrderDetailsScreen(),
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ORDER FROM',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Juan Deck',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('+63 912 345 6789'),
            Text(
              'Zone 6, Gumamela Street, Macanhan Carmen, Cagayan de Oro City, Mis. Or., 9000',
            ),
            SizedBox(height: 8),
            Text(
              'Shop: Gaisano',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                OrderItem(
                  imageUrl: 'Momo_images/egg.png',
                  name: 'Eggs',
                  description:
                      '1 tray of 1 dozen eggs\nWeight:            Volume:',
                  price: 'P 250.00',
                  quantity: 1,
                ),
                OrderItem(
                  imageUrl: 'Momo_images/egg.png',
                  name: 'Butter',
                  description:
                      'Buttercup Margarine\nWeight: 200g    Volume:\n"Keep cold."',
                  price: 'P 250.00',
                  quantity: 2,
                ),
                OrderItem(
                  imageUrl: 'Momo_images/egg.png',
                  name: 'Brown Sugar',
                  description:
                      'Great Value Pure Brown Sugar\nWeight: 1 kilo     Volume:',
                  price: 'P 250.00',
                  quantity: 3,
                ),
                OrderItem(
                  imageUrl: 'Momo_images/egg.png',
                  name: 'All Purpose Flour',
                  description:
                      'Great Value All Purpose Flour\nWeight: 1 kilo   Volume:',
                  price: 'P 250.00',
                  quantity: 2,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Merchandise Estimated Subtotal                        P 1,000.00',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Shipping Subtotal                                                  P 150.00',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Transaction Fee                                                     P 15.00',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Total Payment:                     P 1,165.00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Paid with GCash',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(16),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'Momo_images/check.png',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Customer's payment will be sent into your account.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Continue'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              textStyle: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text('Take Order'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;
  final int quantity;

  OrderItem({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(description),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text('x$quantity'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
