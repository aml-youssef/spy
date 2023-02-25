import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int playersNumber = 2;
int spiesNumber = 1;

class Cards extends StatefulWidget {
  //const Cards({Key? key}) : super(key: key);
  String title;
  bool isPlayer;
  Cards({required this.title, required this.isPlayer});
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {

  void increment(){
    setState(() {
      if(widget.isPlayer){
        playersNumber++;
      }
      else{
        spiesNumber++;
      }
    });
  }

  void decrement(){
    setState(() {
      if(widget.isPlayer){
        if(playersNumber<=2){
          return;
        }
        else {
          playersNumber--;
        }
      }
      else{
        if(spiesNumber<=1){
          return;
        }
        else{
          spiesNumber--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0x51C8C6C6),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  fontSize: 25,
                ),
              ),
              Row(
                children: [
                  IconButtons( currntIcon: Icon(Icons.add), onpressed: increment,),
                  IconButtons(currntIcon: Icon(Icons.minimize_outlined), onpressed: decrement,),
                ],
              ),
            ],
          ),
          Text(
            widget.isPlayer?playersNumber.toString():spiesNumber.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class IconButtons extends StatelessWidget {
  //const IconButtons({Key? key}) : super(key: key);
  Icon currntIcon;
  Function onpressed;
  IconButtons({ required this.currntIcon, required this.onpressed()});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: () => onpressed(),
        icon: currntIcon,
      ),
    );
  }
}

