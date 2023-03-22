import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'first_modal.dart';

class first extends StatefulWidget {
  String? slug;

  first(this.slug, {super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  FiestModel firstModel = FiestModel();
  List<Product>? product = [];


  getdata() async {
    try {
      String url = 'https://dev-api.shotglassfactory.com/api/shop?category_slug=${widget.slug}';
      var response = await Dio().get(url);
      print(url);
      firstModel = FiestModel.fromJson(response.data);
      product!.add(firstModel.data!.products!.first);

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: firstModel.success != null
              ? ListView.builder(
                  itemCount: firstModel.data!.products!.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Text('${firstModel.data!.products![index].productId}'),
                      Text('${firstModel.data!.products![index].slug}'),
                      Text('${firstModel.data!.products![index].feedPrice}'),
                    ]);
                  },
                )
              : const CircularProgressIndicator()),
    );
  }
}
