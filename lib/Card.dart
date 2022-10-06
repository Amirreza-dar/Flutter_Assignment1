import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;
import 'Get_class.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:url_launcher/url_launcher.dart';

class JokeCard extends StatefulWidget {
  const JokeCard();

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  Serializer? model;
  String? _id;
  @override
  void initState() {
    getData();
    _id = model?.id ?? '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> _title = model?.categories ?? ['Undefined'];
    String? _Text = model?.value ?? 'Undefined';
    String? _url = model?.url ?? 'https://api.chucknorris.io';

    return SwipeTo(
        child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
              color: Color(0xFF363f93),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 5.0), //(x,y)
                  blurRadius: 30.0,
                ),
              ],
            ),
            child: _id == model?.id
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            _title[0],
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          margin: EdgeInsets.all(30),
                          child: Text(
                            _Text,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          onPressed: () => launchUrl(Uri.parse(_url)),
                          height: 50,
                          color: Color(0xFF363f93),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Tap for WebPage',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ))
            // ],
            // ),
            ),
        onRightSwipe: () {
          setState(() {
            getData();
            _id = model?.id ?? '0';
          });
        },
        onLeftSwipe: () {
          setState(() {
            setState(() {
              getData();
              _id = model?.id ?? '0';
            });
          });
        });
  }

  Future<void> getData() async {
    Uri url = Uri.parse('https://api.chucknorris.io/jokes/random');
    http.Response res = await http.get(url);
    dynamic body = cnv.jsonDecode(res.body);
    model = Serializer.fromJson(body);
    setState(() {});
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.arrow_back),
            Text(
              'Swipe Right or Left for more jokes',
              style: TextStyle(fontSize: 20),
            ),
            Icon(Icons.arrow_forward),
          ],
        )
      ],
    );
  }
}

