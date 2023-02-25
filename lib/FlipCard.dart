import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'CategoriesList.dart';

class FlipCard extends StatefulWidget {
  //const FlipCard({Key? key}) : super(key: key);
  String currentCategory;
  bool isSpy;
  FlipCard({required this.currentCategory, required this.isSpy});

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {

  bool isBack = true;
  double angle = 0;

  void onTap(){
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }


  @override
  Widget build(BuildContext context) {

    return  Center(
        child: GestureDetector(
          onTap: onTap,
          child: TweenAnimationBuilder(tween: Tween<double>(begin: 0,end: angle), duration: Duration(seconds: 1),
              builder: (BuildContext context, double val, __){
                if (val >= (pi / 2)) {
                  isBack = false;
                }
                else {
                  isBack = true;
                }
                return(
                    Transform(
                      transform: Matrix4.identity()..setEntry(3, 2, 0.001) ..rotateY(val),
                      alignment: Alignment.center,
                      child: Container(
                        child: isBack?
                        Container(
                          height: MediaQuery.of(context).size.height * 0.8,//600.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage("images/unknown.jpg"),
                                fit: BoxFit.fill,
                              )
                          ),
                        ):
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateY(pi),
                          child: Container(alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: widget.isSpy? AssetImage("images/spy3.gif"): AssetImage("images/player.jpg"),
                                  fit: BoxFit.fill,
                                ),
                            ),
                            child: Text(
                              !widget.isSpy?widget.currentCategory:"",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 40.0,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                );
              }
          ),
        ),
    );
  }
}

// class DismissibleCards extends StatefulWidget {
//   //const DismissibleCards({Key? key}) : super(key: key);
//   int playerNumber;
//   String currentCategory;
//   bool isSpy;
//   DismissibleCards({required this.currentCategory, required this.playerNumber, required this.isSpy});
//   @override
//   _DismissibleCardsState createState() => _DismissibleCardsState();
// }
//
// class _DismissibleCardsState extends State<DismissibleCards> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Dismissible(
//           child: FlipCard(currentCategory: "", isSpy: true),
//           key: ValueKey(1),
//           direction: DismissDirection.endToStart,
//           // onDismissed: (direction){
//           // },
//         ),
//
//         Dismissible(
//           //crossAxisEndOffset: 2.0,
//           child: FlipCard(currentCategory: "", isSpy: true),
//           key: ValueKey(2),
//           direction: DismissDirection.endToStart,
//           // onDismissed: (direction){
//           // },
//         ),
//       ],
//     );
//   }
// }
