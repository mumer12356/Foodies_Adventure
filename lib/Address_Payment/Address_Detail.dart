import 'package:flutter/material.dart';
import '../components/constrain.dart';
import '../constructor/Home.dart';
import 'Payment_Detail.dart';


class AddressDetail extends StatefulWidget {
  final List<Home> cartItems;
  final double deliveryFee;
  final double subtotal;
  final List<int> quantities;
  final double totalPrice;


  const AddressDetail({super.key,
    required this.cartItems,
    required this.deliveryFee,
    required this.subtotal,
    required this.quantities,

    required this.totalPrice,

  });

  @override
  State<AddressDetail> createState() => _AddressDetailState();
}

class _AddressDetailState extends State<AddressDetail> {

  double subtotal = 0.0;
  double totalPrice = 0.0;
 
  bool isLoad = false;
  //bool isAddressSelected = false; // Add this boolean flag

  TextEditingController muhalaController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController streetNumberController = TextEditingController();
  TextEditingController elaqaController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController NameController = TextEditingController();



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

    return SafeArea(
      child: Scaffold(

        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Opacity(
                opacity: isLoad ? 0.0 : 1.0,

                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,color: DeepPurpleColor,size: 30),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),

                        ],
                      ),
                      const SizedBox(height: 25.0),
                      const Text('Delivery detail',style: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.bold),),

                      const SizedBox(height: 25.0),

                      const SizedBox(height: 8.0),

                      TextFormField(
                        maxLength: 20,
                        controller: NameController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Name',
                          fillColor: Colors.grey[300],
                          filled: true,
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),

                      TextFormField(
                        maxLength: 20,
                        controller: muhalaController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Muhala',
                          fillColor: Colors.grey[300],
                          filled: true,
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      const SizedBox(height: 8.0),
                      TextFormField(
                        controller: houseNumberController,
                        maxLength: 10,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'House Number',
                          fillColor: Colors.grey[300],
                          filled: true,
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.deepPurple),
                          ),
                        ),

                      ),

                      const SizedBox(height: 16.0),

                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: streetNumberController,
                        maxLength: 30,
                        decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Street Name/Number',
                        fillColor: Colors.grey[300],
                        filled: true,
                        enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        ),
                        ),

                        ),
                        const SizedBox(height: 16.0),

                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: elaqaController,
                        maxLength: 70,
                        decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Elaqa',
                        fillColor: Colors.grey[300],
                        filled: true,
                        enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        ),
                        ),

                        ),

                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: floorController,
                        maxLength: 10,
                        decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Floor',
                        fillColor: Colors.grey[300],
                        filled: true,
                        enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        ),
                        ),

                        ),

                      const SizedBox(height: 16.0),

                      SizedBox(
                        width: 380,
                        child: OutlinedButton(
                            //onPressed: isLoad ? null : _navigateToCheckoutDetail,
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => PaymentDetail(
                                cartItems: widget.cartItems,
                                totalPrice: widget.totalPrice,
                                quantities: widget.quantities,
                                subtotal: widget.subtotal,
                                deliveryFee: widget.deliveryFee,
                                muhala: muhalaController.text, // Pass the muhala data
                                houseNumber: houseNumberController.text,
                                floor: floorController.text,
                                elaqa: elaqaController.text,
                                StreetNumber: streetNumberController.text,// Pass the house number data
                                Name: NameController.text,// Pass the house number data

                              ),
                              ),
                            );
                          },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(DeepPurpleColor)
                            ),

                            child: const Text('Save and continue',
                              style: TextStyle(
                                  color: KWhitetColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),

             // Text('Total Price: Rs. ${totalPrice.toStringAsFixed(2)}'),
              if (isLoad)
                const Center(
                  child: CircularProgressIndicator(), // Replace with your custom loading widget
                ),
            ],

          ),
        ),
      ),
    );
  }
}
