import 'package:flutter/material.dart';
import 'NewGameComponents.dart';
import 'CategoriesList.dart';
import 'CardsScreen.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Categories categories = Categories();
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: (){
            int i;
            while(true){
              i = random.nextInt(Categories.categoriesList.length);
              if(Categories.categoriesList[i].isOpen){
                break;
              }
            }
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context){
              return CardsScreen(
                  playerNumber: playersNumber,
                  spiesNumber: spiesNumber,
                  currentCategory: Categories.categoriesList[i].title
              );
            },
            ),
            );
          },

          child: Text(
              "start",
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "new game",
        ),
      ),
      body:SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage("images/background.jpg",),
                fit: BoxFit.cover,
              ),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Cards(title:"number of players", isPlayer: true,),
                Cards(title:"number of spies", isPlayer: false,),
                Container(
                  child: ExpansionTile(
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    collapsedTextColor: Colors.white70,
                    collapsedIconColor: Colors.white70,
                    title: Text("show categories",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      ),
                    ),
                    subtitle: Text("click to watch"),
                    children:Categories.categoriesWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}