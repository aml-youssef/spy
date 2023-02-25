import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'CardsScreen.dart';
import 'CategoriesList.dart';
import 'dart:math';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class Timer extends StatefulWidget {
  //const Timer({Key? key}) : super(key: key);
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  List <Widget> tipsList  = [];
  double progress = 0;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void notify() {
    if (countText == '0:00:00') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
    tipsList.add(timerScreen(this.context));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void resume () {
    controller.reverse(
        from: controller.value == 0 ? 1.0 : controller.value);
    setState(() {
      isPlaying = true;
    });
  }

  void stop () {
    controller.stop();
    setState(() {
      isPlaying = false;
    });
  }

  void reset (){
    controller.reset();
    setState(() {
      isPlaying = false;
    });
  }

  void showBottomSheet () {
    //if (controller.isDismissed) {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: 300,
          child: CupertinoTimerPicker(
            initialTimerDuration: controller.duration!,
            mode: CupertinoTimerPickerMode.ms,
            onTimerDurationChanged: (time) {
              setState(() {
                controller.duration = time;
              });
            },
          ),
        ),
      );
    //}
  }

  Widget timerScreen (context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.all(10.0),
            // padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child:Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    //color: ,
                    valueColor: AlwaysStoppedAnimation(Color(0x91C8C6C6)),
                    backgroundColor: Colors.black87,
                    value: progress, //TODO: this variable dose not changing
                    strokeWidth: 12,
                  ),
                ),
                AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Text(
                  countText,
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            ),

            // height: MediaQuery.of(this.context).size.height * 0.3,
            // width: MediaQuery.of(this.context).size.width * 0.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.circular(500),
              color: Color(0x51C8C6C6),
              // border: Border.all(
              //   width: 10.0,
              //   color: Colors.white70,
             //),
           ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularButton(
                  currntIcon: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  color: Colors.green,
                  onpressed: resume,
              ),
              CircularButton(
                  currntIcon: Icon(
                    Icons.stop,
                    color: Colors.white,
                  ),
                  color: Colors.red,
                  onpressed: stop,
              ),
              CircularButton(
                currntIcon: Icon(
                  Icons.replay_10_sharp,
                  color: Colors.white,
                ),
                color: Colors.blueAccent,
                onpressed: reset,
              ),
              CircularButton(
                  currntIcon: Icon(
                    Icons.more_time,
                    color: Colors.white,
                  ),
                  color: Colors.blueGrey,
                  onpressed: showBottomSheet,
              ),
            ],
          ),
          TimerButton(title: "give a tip", onPressed: showTip),
          TimerButton(title: "finish the game", onPressed:(){
            cardsList.clear();
            Navigator.of(this.context).pop();
          }),
        ],
      ),
    );
  }

  void showTip(){
    int i = Random().nextInt(tipsStrings.length);
    setState(() {
      tipsList.add(
        GestureDetector(
          onTap: (){
            setState(() {
              tipsList.removeLast();
            });

          },
          child: Expanded(
            child: Container(
              child: Text(
                tipsStrings[i],
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  fontSize: 30,
                ),
              ),
              color: Color(0x99C8C6C6),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
            ),
          ),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: tipsList,
    );
  }
}

class CircularButton extends StatelessWidget {
  //const CircularButton({Key? key}) : super(key: key);
  Icon currntIcon;
  Function onpressed;
  Color color;
  CircularButton({ required this.currntIcon, required this.color, required this.onpressed()});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: CircleAvatar(
        backgroundColor: color,
        child: IconButton(
          icon: currntIcon,
          onPressed: ()=>onpressed(),
        ),
      ),
    );
  }
}

class TimerButton extends StatelessWidget {
  //const TimerButton({Key? key}) : super(key: key);
  String title;
  Function onPressed;
  TimerButton({required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: ()=> onPressed(),
        child: Text(
          title,
        ),
      ),
    );
  }
}
