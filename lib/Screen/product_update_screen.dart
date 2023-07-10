import 'package:crud_with_rest_api_in_flutter/RESTAPI/rest_client.dart';
import 'package:crud_with_rest_api_in_flutter/Screen/product_grid_view_screen.dart';
import 'package:crud_with_rest_api_in_flutter/Style/style.dart';
import 'package:flutter/material.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map productItem;
  const ProductUpdateScreen(this.productItem, {super.key});

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String, String> formValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      formValues.update("Img", (value) => widget.productItem["Img"]);
      formValues.update(
          "ProductCode", (value) => widget.productItem["ProductCode"]);
      formValues.update(
          "ProductName", (value) => widget.productItem["ProductName"]);
      formValues.update("Qty", (value) => widget.productItem["Qty"]);
      formValues.update(
          "TotalPrice", (value) => widget.productItem["TotalPrice"]);
      formValues.update(
          "UnitPrice", (value) => widget.productItem["UnitPrice"]);
    });
    super.initState();
  }

  inputOnChange(productKey, productValue) {
    formValues.update(productKey, (value) => productValue);
    if (mounted) {
      setState(() {});
    }
  }

  formOnSubmit() async {
    if (formValues["Img"]!.trim().isEmpty) {
      errorToast("Image must be required");
    } else if (formValues["ProductCode"]!.trim().isEmpty) {
      errorToast("Product Code must be required");
    } else if (formValues["ProductName"]!.trim().isEmpty) {
      errorToast("Product Name must be required");
    } else if (formValues["Qty"]!.trim().isEmpty) {
      errorToast("Product Qty must be required");
    } else if (formValues["TotalPrice"]!.trim().isEmpty) {
      errorToast("Total Price must be required");
    } else if (formValues["UnitPrice"]!.trim().isEmpty) {
      errorToast("Unit Price must be required");
    } else {
      setState(() {
        isLoading = true;
      });
      await productUpdateRequest(formValues, widget.productItem["_id"]);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ProductGridViewScreen(),
          ),
          (route) => false);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Product"),
      ),
      body: Stack(
        children: [
          backgroundScreen(context),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: formValues["ProductName"],
                        onChanged: (productValue) {
                          inputOnChange("ProductName", productValue);
                        },
                        decoration: appInputDecoration("Product Name"),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: "a",
                        onChanged: (productValue) {
                          inputOnChange("ProductCode", productValue);
                        },
                        decoration: appInputDecoration("Product Code"),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: formValues["Img"],
                        onChanged: (productValue) {
                          inputOnChange("Img", productValue);
                        },
                        decoration: appInputDecoration("Product Image Url"),
                      ),
                      const SizedBox(height: 20),
                      dropDownStyle(
                        DropdownButton(
                          value: formValues["Qty"],
                          isExpanded: true,
                          underline: Container(),
                          items: const [
                            DropdownMenuItem(
                              value: "0",
                              child: Text("Select Qty"),
                            ),
                            DropdownMenuItem(
                              value: "1 pcs",
                              child: Text("1 pcs"),
                            ),
                            DropdownMenuItem(
                              value: "2 pcs",
                              child: Text("2 pcs"),
                            ),
                            DropdownMenuItem(
                              value: "3 pcs",
                              child: Text("3 pcs"),
                            ),
                            DropdownMenuItem(
                              value: "4 pcs",
                              child: Text("4 pcs"),
                            ),
                          ],
                          onChanged: (productValue) {
                            inputOnChange("Qty", productValue);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: formValues["UnitPrice"],
                        onChanged: (productValue) {
                          inputOnChange("UnitPrice", productValue);
                        },
                        decoration: appInputDecoration("Unit Price"),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: formValues["TotalPrice"],
                        onChanged: (productValue) {
                          inputOnChange("TotalPrice", productValue);
                        },
                        decoration: appInputDecoration("Total Price"),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: appButtonStyle(),
                        onPressed: () {
                          formOnSubmit();
                        },
                        child: buttonChild("Updated"),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
