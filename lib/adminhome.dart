import 'package:flutter/material.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<Adminhome> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'Momo_images/typcn_th-menu.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {
            setState(() {
              _isMenuOpen = !_isMenuOpen;
            });
          },
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              'Momo_images/Notification icon.png',
              width: 30,
              height: 30,
            ),
            onPressed: () {
              // Add notifications functionality here
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildDashboardCard(
                  child: Image.asset(
                    'Momo_images/Maki_grocery.png',
                    width: 60,
                    height: 60,
                  ),
                  label: 'Grocery List',
                  routeName: '/grocery_list', // Example route
                ),
                _buildDashboardCard(
                  child: Image.asset(
                      'Momo_images/material-symbols_cancel-rounded.png',
                      width: 60,
                      height: 60),
                  label: 'Canceled Orders',
                  routeName: '/canceled_orders', // Example route
                ),
                _buildDashboardCard(
                  child: Image.asset(
                    'Momo_images/iconamoon_history-bold.png',
                    width: 60,
                    height: 60,
                  ),
                  label: 'Order History & Reports',
                  routeName: '/order_history', // Example route
                ),
                _buildDashboardCard(
                  child: Image.asset(
                    'Momo_images/vec.png',
                    width: 60,
                    height: 60,
                  ),
                  label: 'User  Management',
                  routeName: '/user_management', // Example route
                ),
                _buildDashboardCard(
                  child: Image.asset(
                    'Momo_images/material-symbols_map.png',
                    width: 60,
                    height: 60,
                  ),
                  label: 'Order Monitoring',
                  routeName: '/order_monitoring', // Example route
                ),
                _buildDashboardCard(
                  child: Image.asset(
                    'Momo_images/stash_paperplane-solid.png',
                    width: 60,
                    height: 60,
                  ),
                  label: 'Notifications & Alerts',
                  routeName: '/notifications_alerts', // Example route
                ),
                _buildDashboardCard(
                  child: Image.asset(
                    'Momo_images/eos-icons_admin.png',
                    width: 60,
                    height: 60,
                  ),
                  label: 'Admin Settings',
                  routeName: '/admin_settings', // Example route
                ),
                _buildDashboardCard(
                  child: Image.asset(
                    'Momo_images/mdi_google-analytics.png',
                    width: 60,
                    height: 60,
                  ),
                  label: 'Revenue & Sales Analytics',
                  routeName: '/revenue_sales_analytics', // Example route
                ),
              ],
            ),
          ),
          if (_isMenuOpen)
            Container(
              color: const Color.fromARGB(255, 54, 212, 152),
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                children: [
                  // Add more menu items as needed
                  Spacer(), // Pushes the logout button to the bottom
                  ListTile(
                    leading: Image.asset(
                      'Momo_images/logout.png',
                      width: 80,
                      height: 80,
                    ),
                    onTap: () {
                      // Handle logout functionality here
                    },
                  ),
                ],
              ),
            ),
        ],
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
            label: 'User  List',
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
