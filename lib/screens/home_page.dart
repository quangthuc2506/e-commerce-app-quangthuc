import 'package:e_commerce_app/values/app_assets.dart';
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
      print("height: $height_full");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orangeAccent,
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
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SearchBar(),
            const QuangCaoDauTrang(),
            Container(
              height: 271,
              width: double.infinity,
              color: Colors.red,
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
                        return Container(
                          margin: EdgeInsets.all(10),
                          width: 141,
                          color: Colors.white,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
