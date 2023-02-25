import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'FlipCard.dart';
import 'Timer.dart';

List <Widget> cardsList = [];

class CardsScreen extends StatefulWidget {
  //const CardsScreen({Key? key}) : super(key: key);
  int playerNumber, spiesNumber;
  String currentCategory;
  CardsScreen({required this.playerNumber, required this.spiesNumber, required this.currentCategory});

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  @override
  void initState() {
    super.initState();
    List <bool> isSpy =[];
    for (int i=0; i< widget.playerNumber; i++)
    {
      isSpy.add(false);
    }
    for (int i=widget.playerNumber; i< widget.spiesNumber + widget.playerNumber; i++)
    {
      isSpy.add(true);
    }
    isSpy.shuffle();
    cardsList.add(Timer());
    for (int i=0; i< widget.spiesNumber + widget.playerNumber; i++)
    {
      cardsList.add(
        Dismissible(
          child: FlipCard( currentCategory:widget.currentCategory, isSpy: isSpy[i]),
          key: UniqueKey(),//ValueKey(i),
          direction: DismissDirection.endToStart,
          onDismissed: (direction){
            cardsList.removeLast();//removeAt(i);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover,
              ),
          ),
          child: Stack(
            children:cardsList,
          ),
        ),
      ),
    );
  }
}

