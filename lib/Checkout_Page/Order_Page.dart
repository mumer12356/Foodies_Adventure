import 'package:flutter/material.dart';

import '../Screen/Detail Page/detail_page.dart';
import '../Screen/HomePage/HomePage.dart';
import '../components/constrain.dart';
import '../constructor/Home.dart';


class OrderDetail extends StatefulWidget {
  final List<Home> cartItems;
  final List<int> quantities;
  final double totalPrice;
  final double deliveryFee;

   OrderDetail({super.key,required this.cartItems,
    required this.quantities,
    required this.totalPrice,
    required this.deliveryFee
  });

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {

  void NavigateToHomeandClearCart() {

    // Clear the cart
    DetailPage.cartItems.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
          (route) => false,
    );
  }

  String getCurrentDateTime() {
    DateTime now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')} ${now.hour.toString().
    padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
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
        automaticallyImplyLeading: false,
        backgroundColor: DeepPurpleColor,
        centerTitle: true,
         title: const Text('Order Detail',style: TextStyle(fontSize: 20,
             fontWeight: FontWeight.bold),),
      ),

      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          Home item = widget.cartItems[index];
          int quantity = widget.quantities[index];
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(item.image),
                ),
                title: Text(item.texts),
                subtitle: Text('Quantity: $quantity'),
                //trailing: Text('${item.tprice3}'),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: Container(
        height: 150,
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Order Date:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Text(
                  getCurrentDateTime().split(' ')[0],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Order Time:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Text(
                  getCurrentDateTime().split(' ')[1],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                const Text('Total',style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold),),
                const Spacer(),
                Text(' Rs. ${totalPrice.toStringAsFixed(2)}',style:
                const TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold
                ),),
              ],
            ),

            IconButton(onPressed: NavigateToHomeandClearCart,
                icon: const Icon(Icons.done_all_outlined)),
          ],
        ),
      ),
    );
  }
}
