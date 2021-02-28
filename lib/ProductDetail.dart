import 'package:flutter/material.dart';

import 'Product.dart';
import 'MyShop.dart';

class ProductDetail extends StatelessWidget{

  final Product product;

  const ProductDetail({
    Key key,
    this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF40BAD5),
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 20.0),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'Back'.toUpperCase(),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF1EFF1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Hero(
                        tag: '${product.id}',
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          // the height of this container is 80% of our width
                          height: size.width * 0.8,

                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: size.width * 0.7,
                                width: size.width * 0.7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Image.asset(
                                product.image,
                                height: size.width * 0.75,
                                width: size.width * 0.75,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0 / 2),
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Text(
                      '฿${product.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFA41B),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 20.0 / 2),
                      child: Text(
                        product.description,
                        style: TextStyle(color: Color(0xFF747474)),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary:  Color(0xFF40BAD5),
                          backgroundColor: Color(0xFFFFA41B),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                blurRadius: 8.0,
                                color: Color(0xFFFFFFFF),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => showProductDetail(context, product),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_shopping_cart),
                            Text("ADD TO CART"),
                            Icon(Icons.add_shopping_cart),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
        if(MyShop.totalItems > 0){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        }
        MyShop.totalItems++;
        MyShop.totalPrice += product.price;
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
      title: Text("Add To Cart"),
      content: Text("Do You Want To Add This Product To Your Cart",),
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
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${MyShop.totalItems} items in the cart.\t\t฿${MyShop.totalPrice}'),
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