import 'package:crud_with_rest_api_in_flutter/RESTAPI/rest_client.dart';
import 'package:crud_with_rest_api_in_flutter/Style/style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, String> formValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  bool isLoading = false;

  inputOnChange(productKey, productValue) {
    formValues.update(productKey, (value) => productValue);
    if (mounted) {
      setState(() {});
    }
  }

  formOnSubmit() async {
    if (formValues["Img"]!.trim().isEmpty) {
      errorToast("Image must be required");
    }
    else if (formValues["ProductCode"]!.trim().isEmpty) {
      errorToast("Product Code must be required");
    }
    else if (formValues["ProductName"]!.trim().isEmpty) {
      errorToast("Product Name must be required");
    }
    else if (formValues["Qty"]!.trim().isEmpty) {
      errorToast("Product Qty must be required");
    }
    else if (formValues["TotalPrice"]!.trim().isEmpty) {
      errorToast("Total Price must be required");
    }
    else if (formValues["UnitPrice"]!.trim().isEmpty) {
      errorToast("Unit Price must be required");
    }
    else{
      setState(() {
        isLoading = true;
      });
      await productCreateRequest(formValues);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Product"),
      ),
      body: Stack(
        children: [
          backgroundScreen(context),
          isLoading ? const Center(child: CircularProgressIndicator()): SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (productValue) {
                    inputOnChange("ProductName", productValue);
                  },
                  decoration: appInputDecoration("Product Name"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (productValue) {
                    inputOnChange("ProductCode", productValue);
                  },
                  decoration: appInputDecoration("Product Code"),
                ),
                const SizedBox(height: 20),
                TextFormField(
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
                  onChanged: (productValue) {
                    inputOnChange("UnitPrice", productValue);
                  },
                  decoration: appInputDecoration("Unit Price"),
                ),
                const SizedBox(height: 20),
                TextFormField(
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
                  child: buttonChild("Created"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
