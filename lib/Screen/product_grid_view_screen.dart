import 'package:crud_with_rest_api_in_flutter/Screen/product_create_screen.dart';
import 'package:crud_with_rest_api_in_flutter/Screen/product_update_screen.dart';
import 'package:crud_with_rest_api_in_flutter/Style/style.dart';
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

  deleteData(id) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("DELETE!"),
          content: const Text("Do you want to delete it?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                isLoading = true;
                setState(() {});
                await productDeleteRequest(id);
                await callData();
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  goToUpdateProduct(context, productItem){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  ProductUpdateScreen(productItem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Product"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductCreateScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          backgroundScreen(context),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    await callData();
                  },
                  child: GridView.builder(
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
                                        onPressed: () {
                                          goToUpdateProduct(context, productsList[index]);
                                        },
                                        child: const Icon(
                                          Icons.edit,
                                          size: 18,
                                          color: colorGreen,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      OutlinedButton(
                                        onPressed: () {
                                          deleteData(
                                              productsList[index]["_id"]);
                                        },
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
                  ),
                )
        ],
      ),
    );
  }
}
