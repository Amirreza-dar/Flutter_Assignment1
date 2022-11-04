import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Card.dart';
import 'logic.dart';
import 'package:swipe_to/swipe_to.dart';
import 'UI.dart';

void main() => runApp(
    ChangeNotifierProvider(
        create: (_) => Logic(),
        child: MyApp(),
    )

);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeScreen(),
    );
  }
}

// class _MyHomeScreen extends StatefulWidget {
//   const _MyHomeScreen();
//
//   @override
//   State<_MyHomeScreen> createState() => _MyHomeScreenState();
// }
//
// class _MyHomeScreenState extends State<_MyHomeScreen> {
//   // Serializer? model;
//
//   @override
//   void initState() {
//     Provider.of<Logic>(context, listen: false).initiate();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   // :
//                   height: 360,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(50),
//                     ),
//                     color: Color(0xFF363f93),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black45,
//                         blurRadius: 40.0,
//                         spreadRadius: 4.0,
//                         offset:
//                             Offset(0, 20.0), // shadow direction: bottom right
//                       )
//                     ],
//                   ),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                           top: 80,
//                           left: 0,
//                           child: Container(
//                             height: 100,
//                             width: 300,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 bottomRight: Radius.circular(50),
//                                 topRight: Radius.circular(50),
//                               ),
//                             ),
//                           )
//                       ),
//                       Positioned(
//                           top: 110,
//                           left: 20,
//                           child: Text('Chuck Norris',
//                               style: TextStyle(
//                                 fontSize: 30,
//                                 color: Color(0xFF363f93),
//                                 fontWeight: FontWeight.bold,
//                               )
//                           )
//                       ),
//                       Positioned(
//                           top: 210,
//                           right: 0,
//                           child: Container(
//                               height: 80,
//                               width: 200,
//                               // color: Colors.white,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(50),
//                                   topLeft: Radius.circular(50),
//                                 ),
//                               ),
//
//                               child: MaterialButton(
//                                 onPressed: () => {
//                                   Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) => SecondPage()))
//                                 },
//                                 elevation: 15,
//                                 color: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(50),
//                                     topLeft: Radius.circular(50),
//                                   )
//                                 ),
//                                 child: Text(
//                                   'Favorites',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Color(0xFF363f93),
//                                     fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.05,
//                 ),
//                 JokeCard(true , Provider.of<Logic>(context).CJ.value),
//                 SizedBox(
//                   height: height * 0.01,
//                 ),
//                 // MaterialButton(
//                 //     onPressed:
//                 // )
//                 FooterWidget(),
//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ));
//   }

  // Future<void> getData() async {
  //   Uri url = Uri.parse('https://api.chucknorris.io/jokes/random');
  //   http.Response res = await http.get(url);
  //   dynamic body = cnv.jsonDecode(res.body);
  //   model = Serializer.fromJson(body);
  //   setState(() {});
  // }
// }


// class JokeCard extends StatefulWidget {
//
//   JokeCard(value, joke){
//     second_page = value;
//     // Joke = Provider.of<Logic>(context).;
//   }
//   late final bool second_page;
//   late final String Joke;
//   @override
//   State<JokeCard> createState() => _JokeCardState();
// }
//
// class _JokeCardState extends State<JokeCard> {
//   // Serializer? model;
//   // String? _id;
//   @override
//   void initState() {
//     // getData();
//     // _id = model?.id ?? '0';
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // List<String> _title = model?.categories ?? ['Undefined'];
//     // String? _Text = model?.value ?? 'Undefined';
//     // String? _url = model?.url ?? 'https://api.chucknorris.io';
//
//     return SwipeTo(
//         child: Container(
//             padding: const EdgeInsets.all(20.0),
//             margin: const EdgeInsets.all(30.0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(30.0),
//                 topRight: Radius.circular(30.0),
//                 topLeft: Radius.circular(30.0),
//               ),
//               color: Color(0xFF363f93),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black54,
//                   offset: Offset(0.0, 5.0), //(x,y)
//                   blurRadius: 30.0,
//                 ),
//               ],
//             ),
//             child: false
//                 ? Center(
//               child: CircularProgressIndicator(),
//             )
//                 : Container(
//                 margin: const EdgeInsets.all(5),
//                 padding: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(40.0)),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(top: 30.0),
//                       child: Text(
//                         "",
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.purple,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(30),
//                       child: Text(
//                         widget.Joke ?? 'Not loaded yet!',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.purple,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     widget.second_page ? Buttons() : SizedBox()
//                   ],
//                 )
//             )
//         ),
//         onRightSwipe: () {
//           setState(() {
//             Provider.of<Logic>(context).initiate(); //Provider Consumer
//
//             // getData();
//             // _id = model?.id ?? '0';
//           });
//         },
//         onLeftSwipe: () {
//           setState(() {
//             setState(() {
//               // getData();
//               // _id = model?.id ?? '0';
//             });
//           });
//         }
//     );
//   }
// }
