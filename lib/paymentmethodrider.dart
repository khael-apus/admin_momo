import 'package:flutter/material.dart';

class Paymentmethodrider extends StatefulWidget {
  const Paymentmethodrider({super.key});

  @override
  State<Paymentmethodrider> createState() => _PaymentmethodriderState();
}

class _PaymentmethodriderState extends State<Paymentmethodrider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'Momo_images/back.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Payment Methods',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Cash
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'Momo_images/mdi_account-cash.png',
                            height: 25,
                          ),
                          const SizedBox(width: 10),
                          const Text('Cash'),
                          const Spacer(),
                          Radio(
                            value: 'cash',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'More Payments Options',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left, // Add this line
                    ),
                    const SizedBox(height: 20),
                    // Gcash
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'Momo_images/gcash.png',
                            height: 25,
                          ),
                          const SizedBox(width: 10),
                          const Text('Gcash'),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              // Handle Gcash link
                              print('Gcash link tapped!');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            child: const Text('Link'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Google Pay
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'Momo_images/Google.png',
                            height: 25,
                          ),
                          const SizedBox(width: 10),
                          const Text('Google Pay'),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              // Handle Google Pay link
                              print('Google Pay link tapped!');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            child: const Text('Link'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
