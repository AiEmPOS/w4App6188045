import 'package:flutter/material.dart';

import './ProductContainer.dart';
import './Product.dart';

class MyShop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Expanded(
              child: Stack(
                children: <Widget>[
                  // Our background
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1EFF1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => ProductContainer(
                      itemIndex: index,
                      product: products[index],
                      press: () => showProductDetail(context, products[index]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showProductDetail(BuildContext context, Product product) {
    // Create button
    Widget addToCartButton = TextButton(
      child: Text("Add to Cart"),
      onPressed: () => showSuccessfulDialog(context),
    );

    Widget backButton = TextButton(
      child: Text("Back"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(product.title),
      content: Text(product.description,),
      scrollable: true,
      actions: [
        backButton,
        addToCartButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showSuccessfulDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Add the product to shopping cart'),
      content: Text('Your product has been added to your shopping cart'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
