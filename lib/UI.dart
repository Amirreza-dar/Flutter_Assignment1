import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test1/logic.dart';
import 'Card.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen();

  @override
  State<MyHomeScreen> createState() => MyHomeScreenState();
}

class MyHomeScreenState extends State<MyHomeScreen> {
  // Serializer? model;

  @override
  void initState() {
    Provider.of<Logic>(context, listen: false).initiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // :
                  height: 360,
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
                          )
                      ),
                      Positioned(
                          top: 110,
                          left: 20,
                          child: Text('Chuck Norris',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF363f93),
                                fontWeight: FontWeight.bold,
                              )
                          )
                      ),
                      Positioned(
                        top: 210,
                        right: 0,
                        child: Container(
                          height: 80,
                          width: 200,
                          // color: Colors.white,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              topLeft: Radius.circular(50),
                            ),
                          ),

                          child: MaterialButton(
                            onPressed: () =>
                            {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage()))
                            },
                            elevation: 15,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  topLeft: Radius.circular(50),
                                )
                            ),
                            child: Text(
                              'Favorites',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF363f93),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                JokeCard(true, Provider
                    .of<Logic>(context)
                    .CJ
                    .value),
                SizedBox(
                  height: height * 0.01,
                ),
                // MaterialButton(
                //     onPressed:
                // )
                FooterWidget(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }
}




class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Column(
        children: [
          // AppBar(
          //   title: Text('kiki')
          // ),
          Header(),
          SizedBox(
            height: 30,
          ),
          FavJokeModel(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    )
    );
  }
}


class FavJokeModel extends StatefulWidget {
  const FavJokeModel({Key? key}) : super(key: key);

  @override
  State<FavJokeModel> createState() => _FavJokeModelState();
}

class _FavJokeModelState extends State<FavJokeModel> {
  @override
  Widget build(BuildContext context) {

    Set<String?> Favorite_jokes = Provider.of<Logic>(context).CJ.Favs;
    final List<String?> JokeList = Favorite_jokes.toList();

    return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: JokeList.length,
            itemBuilder: (_, int index){
              return ListTile(
                title: Text(JokeList[index]?? 'Not Found!'),
              );
            }
          );



  }
}


class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    Container(
    // :
    height: 360,
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
    )
    ),
    Positioned(
    top: 110,
    left: 20,
    child: Text('Chuck Norris',
    style: TextStyle(
    fontSize: 30,
    color: Color(0xFF363f93),
    fontWeight: FontWeight.bold,
    )
    )
    ),
    Positioned(
    top: 210,
    right: 0,
    child: Container(
    height: 80,
    width: 200,
    // color: Colors.white,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(50),
    topLeft: Radius.circular(50),
    ),
    ),

    child: MaterialButton(
    onPressed: () => {
      Navigator.pop(context)
    },
    elevation: 15,
    color: Colors.white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(50),
    topLeft: Radius.circular(50),
    )
    ),
    child: Text(
    'HomePage',
    style: TextStyle(
    fontSize: 20,
    color: Color(0xFF363f93),
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),

    ),
    ],
    ),
    ),
    ],
    );
  }
}


