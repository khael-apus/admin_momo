import 'package:flutter/material.dart';

class Grocery_list extends StatefulWidget {
  const Grocery_list({Key? key}) : super(key: key);

  @override
  State<Grocery_list> createState() => _Grocery_listState();
}

class _Grocery_listState extends State<Grocery_list> {
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
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 27, 145, 125),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Grocery List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            label: 'Riders List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'User List',
          ),
        ],
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
