import 'package:e_commerce_app/values/app_assets.dart';
import 'package:e_commerce_app/widgets/product_cart.dart';
import 'package:e_commerce_app/widgets/text_price_product.dart';
import 'package:e_commerce_app/widgets/text_product_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  double height_full = 0.0;
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      height_full = _key.currentContext!.size!.height;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.window_outlined), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: "Trend"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_outlined), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
      resizeToAvoidBottomInset: false,
      key: _key,
      appBar: AppBar(
        title: const Text(
          "HomePage",
          style: TextStyle(),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.orangeAccent,
                child: Column(
                  children: const[
                     SearchBar(),
                     QuangCaoDauTrang(),
                     FeaturedList(),
                  ],
                ),
              ),
              const Category(),
              const FlashSale(),
              const RecommandProduct(),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}

class FlashSale extends StatelessWidget {
  const FlashSale({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: const [
              TextStyleCatagory(name: "Flash sales"),
              TextStyleCatagory(name: "See more")
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Container(
            height: 242.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProductCart(
                  productName: "FS - Nike Air Max 270 React React React React",
                  price: 299.43,
                  priceSale: 534.0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecommandProduct extends StatelessWidget {
  const RecommandProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: const [
              TextStyleCatagory(name: "Recommand"),
              TextStyleCatagory(name: "See more")
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.79),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ProductCart(
                productName: "FS - Nike Air Max 270 React React React React",
                price: 299.43,
                priceSale: 534.44,
              );
            },
          ),
        ],
      ),
    );
  }
}

class FeaturedList extends StatelessWidget {
  const FeaturedList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: const [
              TextStyleCatagory(name: "Featured"),
              TextStyleCatagory(name: "See more")
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Container(
            height: 238.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProductCart(
                  productName: "FS - Nike Air Max 270 React React React React",
                  price: 299.43,
                  priceSale: 534.44,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TextStyleCatagory(name: "Category"),
              TextStyleCatagory(name: "More Category")
            ],
          ),
          Container(
            width: double.infinity,
            height: 112,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (builder, context) {
                  return Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(left: 25, top: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            AppAssets.logoSach,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: TextProductName(productName: "Novel"),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class TextStyleCatagory extends StatelessWidget {
  final String? name;
  const TextStyleCatagory({Key? key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      name!,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}

class QuangCaoDauTrang extends StatelessWidget {
  const QuangCaoDauTrang({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          AppAssets.tiki1,
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: "Search everything",
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          )),
    );
  }
}
