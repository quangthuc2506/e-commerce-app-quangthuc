import 'package:flutter/material.dart';

class TextPriceProduct extends StatelessWidget {
  double price;
  double? priceSale;
  TextPriceProduct.sales({Key? key, required this.price, this.priceSale})
      : super(key: key);
  TextPriceProduct({Key? key, required this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text("\$$price",
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700)),
        ),
        RichText(
          text: priceSale != null
              ? TextSpan(children: [
                  TextSpan(
                      text: "\$$priceSale",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough)),
                  TextSpan(
                      text:
                          "       ${((1 - price / priceSale!) * 100).round()}% Off",
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.w700)),
                ])
              : TextSpan(text: ""),
        ),
      ],
    );
  }
}
