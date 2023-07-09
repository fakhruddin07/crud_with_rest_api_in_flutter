import 'package:crud_with_rest_api_in_flutter/Style/style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Product"),
      ),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("Product Name"),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("Product Code"),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("Product Image Url"),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("Unit Price"),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("Total Price"),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
