import 'package:flutter/material.dart';

class Revenue_sales_analytics extends StatefulWidget {
  const Revenue_sales_analytics({super.key});

  @override
  State<Revenue_sales_analytics> createState() =>
      _Revenue_sales_analyticsState();
}

class _Revenue_sales_analyticsState extends State<Revenue_sales_analytics> {
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
          'Revenue & Sales Analytics',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _buildDashboardCard({
    required Widget child,
    required String label,
    required String routeName, // New parameter for route name
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: const Color.fromARGB(255, 54, 212, 152),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
              context, routeName); // Navigate to the specified route
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
