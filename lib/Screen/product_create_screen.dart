import 'package:crud_with_rest_api_in_flutter/Style/style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  Map<String, String> formValues = {
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":""
  };

  inputOnChange(productKey, productValue){
    formValues.update(productKey, (value) => productValue);
    if(mounted){
      setState(() {});
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
          Container(
            child: SingleChildScrollView(
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
                      items: [
                        DropdownMenuItem(
                          child: Text("Select Qty"),
                          value: "",
                        ),
                        DropdownMenuItem(
                          child: Text("1 pcs"),
                          value: "1 pcs",
                        ),
                        DropdownMenuItem(
                          child: Text("2 pcs"),
                          value: "2 pcs",
                        ),
                        DropdownMenuItem(
                          child: Text("3 pcs"),
                          value: "3 pcs",
                        ),
                        DropdownMenuItem(
                          child: Text("4 pcs"),
                          value: "4 pcs",
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

                  Container(
                    child: ElevatedButton(
                      style: appButtonStyle(),
                      onPressed: () {},
                      child: buttonChild("Created"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
