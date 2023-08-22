  import 'package:flutter/material.dart';
  import '../Address_Payment/Address_Detail.dart';
import '../Screen/HomePage/HomePage.dart';
import '../components/constrain.dart';
import '../constructor/Home.dart';


  
  class CartPage extends StatefulWidget {
    final List<Home> cartItems;
  
  
  
    CartPage({super.key,
       required this.cartItems,
    });
  
    @override
    State<CartPage> createState() => _CartPageState();
  }
  
  class _CartPageState extends State<CartPage> {
    List<int> _quantities=List<int>.empty(growable: true);
  
    double deliveryfee=50.0;
    double subtotal=0.0;
    double totalPrice = 0.0;
    bool isLoading=false;
    bool _isBottomSheetVisible = false;
  
    void _toggleBottomSheetVisibility() {
      setState(() {
        _isBottomSheetVisible = !_isBottomSheetVisible;
      });
    }
  
  
    void _calculateSubtotal(){
      subtotal=0.0;
      for (int i = 0; i < widget.cartItems.length; i++) {
        Home item = widget.cartItems[i];
        int quantity = _quantities[i];
        String priceString = item.tprice3.replaceAll('Rs. ', '').replaceAll(',', '');
        double itemPrice = double.tryParse(priceString) ?? 0.0;
        subtotal += itemPrice * quantity;
      }
    }
  
    void _calculateTotalPrice(){
       totalPrice= subtotal + deliveryfee;
    }
  
    void showOptionDialog(int index){
      int quantity=_quantities[index];
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:   const Text('Box Option'),
              content: const Text('Choose an option'),
              actions: [
                OutlinedButton(
                    onPressed: (){
                      setState(() {
                        _quantities[index]= quantity + 1;
                        _calculateSubtotal();
                        _calculateTotalPrice();
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.add),
                ),
                OutlinedButton(
                  onPressed: (){
                    setState(() {
                      if (quantity > 1) {

                        _quantities[index]= quantity - 1;
                        _calculateSubtotal();
                        _calculateTotalPrice();
                      }
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            );
          },);
    }

    void _removeItem(int index){
      setState(() {
        widget.cartItems.removeAt(index);
        //_quantities.removeAt(index);
        _calculateSubtotal();
        _calculateTotalPrice();
      });
    }
  
  
    @override
    void initState(){
      super.initState();
      // Initialize the quantities list with initial values
      _quantities = List<int>.filled(widget.cartItems.length, 1);
      _calculateSubtotal();
      _calculateTotalPrice();
    }
  
  
    void _navigateToCheckout(){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddressDetail(
  
            cartItems: widget.cartItems,
            deliveryFee: deliveryfee,
            subtotal: subtotal,
            quantities: _quantities,
            totalPrice: totalPrice,
          ),
        ),
      );
        //   .then((value) {
        // if(widget.cartItems.isEmpty){
        //   return Text('Thank You');
        // }

    }
  
    @override
  
    Widget build(BuildContext context) {
      // _calculateTotalPrice();
  
      return SafeArea(
        child: Scaffold(
  
          bottomNavigationBar: Container(
            height: 120,
            // margin: EdgeInsets.only(bottom: 20,left: 20,right: 20),
            // padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: KWhitetColor,
            ),
            child: Column(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
  
                    Text('Total',
                      style: TextStyle(color: KBlackColor,fontSize: 25,
                          fontWeight: FontWeight.bold),),
                    Column(
                      children: [
                        IconButton(
                          onPressed: _toggleBottomSheetVisibility,
                          icon: _isBottomSheetVisible ?
                          const Icon(Icons.arrow_drop_down) :
                          const Icon(Icons.arrow_drop_up),
                        ),
                        const Text('See price breakdown')
                      ],
                    ),
                    // IconButton(
                    //     onPressed: _toggleBottomSheetVisibility,
                    //     icon: _isBottomSheetVisible ?
                    //     Icon(Icons.arrow_drop_down) :
                    //     Icon(Icons.arrow_drop_up),
                    // ),
                    const Spacer(),
                    Text('Rs. $totalPrice',
                      style: TextStyle(color: KBlackColor,fontSize: 20),),
  
                  ],
                ),
  
                SizedBox(
                  width: 400,
                  child: OutlinedButton(
                      onPressed: isLoading ? null : _navigateToCheckout,
  
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(DeepPurpleColor)
                    ),
                      child: const Text("Continue to Proceed",
                      style: TextStyle(
                        color: KWhitetColor,
                        fontSize: 17
                      ),
                      ),
                  ),
                ),
  
              ],
            ),
          ),
  
  
          appBar: AppBar(
            backgroundColor: DeepPurpleColor,
            leading: IconButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage(),),);
                },
                icon: const Icon(Icons.arrow_back_ios),),
            title: const Text('Cart'),
            centerTitle: true,
          ),
  
  
          body:ListView.builder(
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              Home item=widget.cartItems[index];
              int quantity=_quantities[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: const Text('Cancel',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: const Text('Remove Item'),
                                content: const Text('Are you sure you want to remove '
                                    'this item from the cart?'),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                        _removeItem(index);
                                      },
                                      child: const Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                    child: const Text('No'),
                                  ),
                                ],
                            );
                          },
                      );
                    },
                  ),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          showOptionDialog(index);
                        },
                        child: Row(
                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$quantity',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        height: 100,

                        child: Row(
                          children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(item.image),
                            radius: 40,
                            ),
                            Text(item.texts,
                            style: const TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text('${item.tprice3}'),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: DeepPurpleColor,
                  ),
                ],
              );
            },
          ),
  
  
          bottomSheet: _isBottomSheetVisible ?
          Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(top: 20),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Subtotal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 20
                      ),
                    ),
                    const Spacer(),
                    Text('Rs. $subtotal',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 20
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Text('Delivery Fee',
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    const Spacer(),
                    Text('Rs. $deliveryfee',
                      style: const TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ) : null ,
        ),
      );
    }
  }
  
