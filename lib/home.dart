import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay/payment_contorller.dart';

class Home extends StatelessWidget {
  final PaymentController paymentController = Get.put(PaymentController());

  MaterialButton getMaterialButton({String price}) {
    return MaterialButton(
        onPressed: () => {
              paymentController.dispatchPayment(
                  20,
                  "Akshat",
                  "9461246324",
                  "this is for music headphones",
                  "akshatsoni396@gmail.com",
                  "Paytm")
            },
        child: const Text("Buy Now"),
        color: Colors.blue);
  }

  Container getContainerDes({String imageurl, String price}) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            // "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
            imageurl,
          ),
        ),
      ),
    );
  }

  Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              getContainerDes(
                  imageurl:
                      "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80"),
              const SizedBox(height: 10),
              getMaterialButton(),
              const SizedBox(height: 10),
              getContainerDes(
                  imageurl:
                      "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
              const SizedBox(height: 10),
              getMaterialButton(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names

}
