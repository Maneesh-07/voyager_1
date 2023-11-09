
import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  final String productName, labelText;

  const CustomTextFormWidget({
    super.key,
    required this.controller,
    required this.productName,
    required this.labelText,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: labelText,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
