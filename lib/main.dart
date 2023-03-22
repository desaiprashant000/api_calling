import 'package:api_calling/dolphine.dart';
import 'package:api_calling/firstpage.dart';
import 'package:api_calling/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: demo(),
    debugShowCheckedModeBanner: false,
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  List<ChildCategories> childcategories = [];
  Welcome welcome = Welcome();

  getdata() async {
    try {
      var response = await Dio().get('https://dev-api.shotglassfactory.com/api/navbar-data');
      Map<String, dynamic> m = response.data;
      print(m);
      dolphin child = dolphin.fromJson(m);
      welcome = Welcome.fromJson(response.data);
      setState(() {
        childcategories = child.sgfCategory!.childCategories!;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: childcategories.length > 0
          ? ListView.builder(
              itemBuilder: (context, index) {
                ChildCategories d = childcategories[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                          "${welcome.sgfCategory!.childCategories![index].categoryId}"),
                      subtitle: Text("${d.name}"),
                      trailing: Text("${d.slug}"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => first(welcome
                                  .sgfCategory!.childCategories![index].slug),
                            ));
                      },
                    ),
                  ],
                );
              },
              itemCount: childcategories.length,
            )
          : const CircularProgressIndicator(),
    );
  }
}
