import 'package:crud_with_rest_api_in_flutter/Style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RESTAPI/rest_client.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List productsList = [];
  bool isLoading = false;

  @override
  void initState() {
    callData();
    super.initState();
  }

  callData() async {
    isLoading = true;
    var data = await productGetRequest();
    productsList = data;
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Product"),
      ),
      body: Stack(
        children: [
          backgroundScreen(context),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  itemCount: productsList.length,
                  gridDelegate: productGridViewStyle(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              productsList[index]["Img"],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productsList[index]["ProductName"]),
                                const SizedBox(width: 10),
                                Text(
                                    "Price: ${productsList[index]["UnitPrice"]} BDT"),
                                Row(
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.edit,
                                        size: 18,
                                        color: colorGreen,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.delete,
                                        size: 18,
                                        color: colorRed,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
        ],
      ),
    );
  }
}
