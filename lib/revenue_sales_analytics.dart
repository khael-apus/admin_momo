import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Revenue_sales_analytics extends StatefulWidget {
  const Revenue_sales_analytics({super.key});

  @override
  State<Revenue_sales_analytics> createState() =>
      _Revenue_sales_analyticsState();
}

class _Revenue_sales_analyticsState extends State<Revenue_sales_analytics> {
  String selectedView = 'Weekly';

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
          'Revenue & Analytics',
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
            // Top Cards for Consumer and Subscription
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard('Consumer', '5'),
                _buildInfoCard(
                  'Subscription',
                  '3',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '60%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Priority: 1\nExpress: 2',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Revenue Chart Card
            _buildChartCard(),
            const SizedBox(height: 16),
            // Bottom Cards for Total and Average Revenue
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard('Total Revenue', '₱10,000', isWide: true),
                _buildInfoCard('Avg. Revenue', '₱1428.571', isWide: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value,
      {Widget? child, bool isWide = false}) {
    return Container(
      width: isWide ? MediaQuery.of(context).size.width * 0.43 : null,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 54, 212, 152),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child ??
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildChartCard() {
    return Container(
      height: 250, // Specify height for the chart
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Revenue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                value: selectedView,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(
                    value: 'Weekly',
                    child: Text('Weekly'),
                  ),
                  DropdownMenuItem(
                    value: 'Monthly',
                    child: Text('Monthly'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedView = value!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
