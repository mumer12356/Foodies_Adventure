import 'package:flutter/material.dart';

import '../Checkout_Page/Checkout_page.dart';
import '../components/constrain.dart';
import '../constructor/Home.dart';

class PaymentDetail extends StatefulWidget {
  final List<Home> cartItems;
  final double deliveryFee;
  final double subtotal;
  final List<int> quantities;
  final double totalPrice;

  final String muhala;
  final String houseNumber;
  final String StreetNumber;
  final String elaqa;
  final String floor;
  final String Name;



   PaymentDetail({Key? key,
     required this.cartItems,
      required this.deliveryFee,
      required this.subtotal,
      required this.quantities,
      required this.totalPrice,

     required this.muhala,
     required this.houseNumber,
    required this.elaqa,
    required this.floor,
    required this.StreetNumber,
    required this.Name,
  }) : super(key: key);

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  String? _paymentMethod;
  bool isLoading = false;

  double subtotal = 0.0;
  double totalPrice = 0.0;




  void _navigateToCheckoutPage() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => checkout(
          cartItems: widget.cartItems,
          totalPrice: widget.totalPrice,
          quantities: widget.quantities,
          subtotal: widget.subtotal,
          deliveryFee: widget.deliveryFee,
          muhala: widget.muhala, // Pass the muhala data
          houseNumber: widget.houseNumber,
          StreetNumber: widget.StreetNumber,
          elaqa: widget.elaqa,
          floor: widget.floor,
          Name: widget.Name,
        ),
        ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {

    double subtotal = 0.0;
    for (int i = 0; i < widget.cartItems.length; i++) {
      Home item = widget.cartItems[i];
      //int quantity = _quantities[i];
      String priceString = item.tprice3.replaceAll('Rs. ', '').replaceAll(',', '');
      double itemPrice = double.tryParse(priceString) ?? 0.0;
      subtotal += itemPrice * widget.quantities[i];
    }

    // Calculate the total price
    double totalPrice = subtotal + widget.deliveryFee;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: DeepPurpleColor,
        title: const Text('Payments'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RadioListTile<String>(
                title: const Text('Jazzcash'),
                value: 'Jazzcash',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Easypaisa'),
                value: 'Easypaisa',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Bank Account'),
                value: 'Bank Account',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value;
                  });
                },
              ),


              RadioListTile<String>(
                title: const Text('Cash'),
                value: 'Cash',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value;
                  });
                  _navigateToCheckoutPage();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
