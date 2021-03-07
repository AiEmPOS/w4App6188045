import 'package:flutter/material.dart';
import 'package:w4app6188045/ShoppingCart.dart';

import './ProductContainer.dart';
import './Product.dart';
import './ProductDetail.dart';
import './ProductJ.dart';

class MyShop extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyShopState();
  }
}

class MyShopState extends State<MyShop> {

  static int totalItems = 0;
  static int totalPrice = 0;
  static var selectedIndex = [];
  bool start = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var fetcher = fetchProductJ();
  }

  @override
  Widget build(BuildContext context) {

    // if(start){
    //   fetchProductJ();
    //   start = false;
    // }
    print(ProductJ.productsJ);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF40BAD5),
        centerTitle: false,
        title: Text(
          '6188045 Computer Shop',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShoppingCart()
                  )
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ],
      ),
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
                    itemCount: ProductJ.productsJ.length,
                    itemBuilder: (context, index) => ProductContainer(
                      itemIndex: index,
                      product: ProductJ.productsJ[index],
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                product: products[index],
                                index: index,
                              )
                          )
                        );
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        /*showProductDetail(context, products[index])*/
                      },
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
      onPressed: () {
        showSuccessfulDialog(context);
        if(totalItems > 0){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        }
        totalItems++;
        totalPrice += product.price;
      },
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('${totalItems} items in the cart.\t\t฿${totalPrice}'),
              duration: Duration(days: 365),
          )
        );
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
