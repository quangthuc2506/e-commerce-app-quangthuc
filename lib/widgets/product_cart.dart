import 'package:e_commerce_app/values/app_assets.dart';
import 'package:e_commerce_app/widgets/text_price_product.dart';
import 'package:e_commerce_app/widgets/text_product_name.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  String productName;
  double price;
  double? priceSale;
  ProductCart({Key? key, required this.productName, required this.price, this.priceSale}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 109,
                height: 109,
                child: Image.asset(AppAssets.giay1),
              ),
              SizedBox(
                  width: 109,
                  child: TextProductName(
                      productName:productName)),
              TextPriceProduct.sales(
                price: price,
                priceSale: priceSale,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
