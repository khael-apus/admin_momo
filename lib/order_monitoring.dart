import 'package:flutter/material.dart';

class Order_monitoring extends StatefulWidget {
  const Order_monitoring({super.key});

  @override
  State<Order_monitoring> createState() => _Order_monitoringState();
}

class _Order_monitoringState extends State<Order_monitoring> {
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
          'Order Monitoring',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search and Filter Row
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Order ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF36D498),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Search'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Table Headers
            Container(
              color: const Color(0xFFE6E6E6),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: const [
                  Expanded(
                      flex: 2,
                      child: Text('Order No.',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      flex: 2,
                      child: Text('Status',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      flex: 2,
                      child: Text('Service',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      flex: 3,
                      child: Text('Tracking Code',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const Divider(height: 0, thickness: 1),
            // Table Rows
            Expanded(
              child: ListView(
                children: [
                  _buildTableRow(
                    orderNo: '12345',
                    status: 'New Order',
                    service: 'Priority',
                    trackingCode: '772979467',
                  ),
                  const Divider(height: 0, thickness: 1),
                  _buildTableRow(
                    orderNo: '23467',
                    status: 'Cancelled',
                    service: 'Standard',
                    trackingCode: '772979466',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableRow({
    required String orderNo,
    required String status,
    required String service,
    required String trackingCode,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(orderNo)),
          Expanded(flex: 2, child: Text(status)),
          Expanded(flex: 2, child: Text(service)),
          Expanded(flex: 3, child: Text(trackingCode)),
        ],
      ),
    );
  }
}
