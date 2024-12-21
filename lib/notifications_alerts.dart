import 'package:flutter/material.dart';

class Notifications_alerts extends StatefulWidget {
  const Notifications_alerts({super.key});

  @override
  State<Notifications_alerts> createState() => _Notifications_alertsState();
}

class _Notifications_alertsState extends State<Notifications_alerts> {
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
          'Notifications & Alerts',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notification Manager',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'Momo_images/mdi_mail.png',
                        width: 24.0, // Adjust size as needed
                        height: 24.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'Momo_images/bas.png',
                        width: 24.0, // Adjust size as needed
                        height: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  _buildTextField(label: 'Notification Title'),
                  const SizedBox(height: 8),
                  _buildTextField(label: 'Notification Type'),
                  const SizedBox(height: 8),
                  _buildTextField(label: 'Notification Status'),
                  const SizedBox(height: 8),
                  _buildTextField(label: 'Date Added'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 54, 212, 152),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Text('Notification Title',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text('Notification Type',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text('Content',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text('Status',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text('Date',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Center(
                        child: Text('No data available'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 54, 212, 152),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
