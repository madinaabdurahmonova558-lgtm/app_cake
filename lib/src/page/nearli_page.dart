import 'package:flutter/material.dart';

class NearliPage extends StatelessWidget {
  const NearliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
            children: [
              const SizedBox(height: 60),

              /// HEADER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    const Spacer(),
                    const Text("Nearly there...", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.menu),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text("Please select a payment method", style: TextStyle(fontSize: 15),),
              const SizedBox(height: 40),
              /// PAYMENTS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  paymentBox("PayPal"),
                  const SizedBox(width: 10),
                  paymentBox("Apple Pay"),
                ],
              ),

              const SizedBox(height: 25),
              const Text("or enter your card details below", style: TextStyle(fontSize: 15),),
              const SizedBox(height: 25),

              const SizedBox(height: 20),

              /// INPUTS
              buildField("Name on card"),
              buildField("Card Number"),
              buildField("Sort Code"),
             
              Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'CVC Number',
          border:  OutlineInputBorder(),
        ),
      ),
    ),

              const SizedBox(height: 10),

              /// PAY BUTTON
              Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("Pay", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
    );
  }

  Widget paymentBox(String text) {
    return Container(
      width: 120,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Text(text)),
    );
  }

  Widget buildField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextField(
        
        decoration: InputDecoration(
          hintText: hint,
          border:  OutlineInputBorder(),
        ),
      ),
    );
  }
}