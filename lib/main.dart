import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;
import 'Get_class.dart';
import 'Card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyHomeScreen(),
    );
  }
}

class _MyHomeScreen extends StatefulWidget {
  const _MyHomeScreen();

  @override
  State<_MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<_MyHomeScreen> {
  Serializer? model;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // :
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                    color: Color(0xFF363f93),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 40.0,
                        spreadRadius: 4.0,
                        offset:
                            Offset(0, 20.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 80,
                          left: 0,
                          child: Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),
                          )),
                      Positioned(
                          top: 110,
                          left: 20,
                          child: Text('Chuck Norris',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF363f93),
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                JokeCard(),
                SizedBox(
                  height: height * 0.01,
                ),
                FooterWidget(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }

  Future<void> getData() async {
    Uri url = Uri.parse('https://api.chucknorris.io/jokes/random');
    http.Response res = await http.get(url);
    dynamic body = cnv.jsonDecode(res.body);
    model = Serializer.fromJson(body);
    setState(() {});
  }
}
