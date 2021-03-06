import 'package:flutter/material.dart';

import './ProductContainer.dart';
import './Product.dart';
import './MyShop.dart';


class ShoppingCart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ShoppingCartState();
  }
}

class ShoppingCartState extends State<ShoppingCart>{

  var hasBeenPressed = [];
  int totalPrice = 0;
  int numSelected = 0;

  bool start = true;

  @override
  Widget build(BuildContext context) {
    if(start) {
      for (int i = 0; i < MyShop.selectedIndex.length; i++) {
        hasBeenPressed.add(0);
      }
      start = false;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF40BAD5),
        centerTitle: false,
        title: Text(
          'Shopping Cart',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.contact_phone_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
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
                    itemCount: MyShop.selectedIndex.length,
                    itemBuilder: (context, index) => Container(
                      color: hasBeenPressed[index] == 0? Colors.white : Colors.tealAccent,
                      child: InkWell(
                        onTap: (){
                          this.setState(() {
                            if(hasBeenPressed[index] == 1){
                              hasBeenPressed[index]--;
                            }else{
                              hasBeenPressed[index]++;
                            }
                            print(hasBeenPressed);
                            if(hasBeenPressed[index] == 1){
                              totalPrice += products[MyShop.selectedIndex[index]].price;
                              numSelected++;
                            }else{
                              totalPrice -= products[MyShop.selectedIndex[index]].price;
                              numSelected--;
                            }
                          });
                        },
                        child: ProductContainer(
                          itemIndex: index,
                          product: products[MyShop.selectedIndex[index]],
                        ),
                      ),
                    ),

                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      alignment: Alignment.bottomCenter,
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
                        onPressed: (){
                          int numRemoved = 0;
                          showSuccessfulDialog(context);
                          MyShop.totalItems -= numSelected;
                          MyShop.totalPrice -= totalPrice;
                          print(MyShop.selectedIndex);
                          for(int i = 0; i < hasBeenPressed.length; i++){
                            if(hasBeenPressed[i] == 1){
                              MyShop.selectedIndex.removeAt(i - numRemoved++);
                            }
                          }
                          print(MyShop.selectedIndex);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.monetization_on),
                            Text("Price ฿${this.totalPrice}"),
                            Icon(Icons.monetization_on),
                          ],
                        ),
                      ),
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

  showSuccessfulDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
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
      title: Text('Payment Successfully'),
      content: Text('Thank you for shopping with us!'),
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