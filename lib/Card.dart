import 'package:flutter/material.dart';
import 'package:test1/Data.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'logic.dart';

class JokeCard extends StatefulWidget {

  JokeCard(value, joke){
    second_page = value;
  }
  late final bool second_page;
  late final String? Joke;
  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.Joke = Provider.of<Logic>(context).CJ.value;

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
            child:
                 Container(
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
                           "",
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
                            widget.Joke ?? 'Not loaded yet!',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        widget.second_page ? Buttons() : SizedBox()
                      ],
                    )
              )
            ),
        onRightSwipe: () {
          setState(() {
            Provider.of<Logic>(context, listen: false).initiate();

          });
        },
        onLeftSwipe: () {
          setState(() {
            setState(() {
              Provider.of<Logic>(context, listen: false).initiate();

            });
          });
        }
        );
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

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () => launchUrl(Uri.parse(Provider.of<Logic>(context).CJ.url ?? 'https://api.chucknorris.io/jokes/random')),
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
        MaterialButton(
          onPressed: () => {
            Provider.of<Logic>(context, listen: false).Add()
          },
          elevation: 10,
          color: Color(0xFF363f93),
          child: Icon(
            Icons.thumb_up,
            size: 35.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(15),
          shape: CircleBorder(),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}














class FavJokeCard extends StatelessWidget {


  FavJokeCard(value){
    Joke = value;
  }
  late final CurrentJoke Joke;


  @override
  Widget build(BuildContext context) {
    return Container(
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
        child
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
                    Joke.value ?? 'Not Loaded yet!',
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
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
                    "_Text",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox()
              ],
            )
        )
    );
  }
}





