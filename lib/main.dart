import 'package:flutter/material.dart';
import 'package:food/welcomeScreen.dart';
import 'package:food/admin_login.dart';
import 'package:food/adminhome.dart';
import 'package:food/grocery_list.dart';
import 'package:food/canceled_orders.dart';
import 'package:food/order_history.dart';
import 'package:food/user_management.dart';
import 'package:food/order_monitoring.dart';
import 'package:food/notifications_alerts.dart';
import 'package:food/admin_settings.dart';
import 'package:food/revenue_sales_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MomoApp());
}

class MomoApp extends StatelessWidget {
  const MomoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momo App',
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {
        '/admin_login': (context) => const Admin_login(),
        '/adminhome': (context) => const Adminhome(),
        '/grocery_list': (context) => const Grocery_list(),
        '/canceled_orders': (context) => const Canceled_orders(),
        '/order_history': (context) => const Order_history(),
        '/user_management': (context) => const User_management(),
        '/order_monitoring': (context) => const Order_monitoring(),
        '/notifications_alerts': (context) => const Notifications_alerts(),
        '/admin_settings': (context) => const Admin_settings(),
        '/revenue_sales_analytics': (context) =>
            const Revenue_sales_analytics(),
      },
    );
  }
}
