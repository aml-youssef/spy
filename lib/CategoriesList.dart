import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category{
  String title ;
  bool isOpen;
  Category({required this.title, required this.isOpen});
}

class Categories{
    List categories = [
    "كازينو",
    "قاعدة ارهابيين",
    "بانك",
    "مستشفي",
    "وحدة عسكرية",
    "سينما",
    "بياع خضار",
    "سفينة",
    "بنزينة",
    "فندق",
    "القطر",
    "الشاطئ",
    "غواصة",
    "قسم الشرطة",
    "مطعم",
    "المطار",
    "سبا",
    "سوبر ماركت",
        "محل بقالة",
    "المسرح",
    "الكلية",
    "الكنيسة",
    "الجامع",
    "المدرسة",
    "السيرك",
  ];

  static List <Category> categoriesList = [];

  Categories(){
    for(int i = 0; i<categories.length; i++){
      categoriesList.add(Category(title: categories[i], isOpen: true));
    }
  }

  static List <Widget> categoriesWidget(){
    List <Widget> temp = [];
    for(int i = 0; i<categoriesList.length; i++){
      temp.add(CategoriesSwitch(category: categoriesList[i],));
    }
    temp.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add,),
            onPressed: (){},
          ),
        ],
      ),
    );
    return temp;
  }

}

//TODO: what if he user closed all of the categories?????????????????????????



class CategoriesSwitch extends StatefulWidget {
  //const CategoriesSwitch({Key? key}) : super(key: key);
  Category category;
  CategoriesSwitch({required this.category});
  @override
  _CategoriesSwitchState createState() => _CategoriesSwitchState();
}

class _CategoriesSwitchState extends State<CategoriesSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwitchListTile(
        value: widget.category.isOpen,
        onChanged: (bool value){
          setState(() {
            widget.category.isOpen = value;
          });
        },
        title: Text(widget.category.title,),
      ),
    );
  }
}

List <String> tipsStrings =
[
  "المكان بعيد ؟",
  "مين مش مسموح له انه يروح للمكان دة ؟",
  "هل وجودك في المكان دة هيغير حياتك ؟",
  "كم من الوقت استطيع ان ابقي هناك؟",
  "هتلبس اية لو رحت هناك؟",
  "مين ممكن يكون عايز يروح هناك؟",
  "هل تحب انتك تفضل هناك وقت اطول؟",
  "هل البقاء هناك ممتع؟",
  "اية احسن حاجة تتلبس هناك؟",
  "لية حدش عايز يروح هناك؟",
  "هل الناس بينبسطوا هناك؟",
  "ريحته حلوة؟",
  "مين بيكون موجود هناك؟",
  "هل تقدر تغالدر المكان بارادتك الحرة؟",
  "اية الحلو في المكان دة؟",
  "هل المكان هادي ؟",
  "هل تنصح الناس تروح هناك؟",
  "تحب تروح حفلة هناك؟",
  "هل هتكون خايف في المكان دة ؟",
  "هل هتكون خايف من شخص راح هناك؟",
  "اية اللون الغالب هناك؟",
  "اية الحاجة الي يتخاف منها هناك؟",
  "هل نقدر نتمشي هناك؟",
  "ابة احسن وحقت في السنة اروح فيه هناك؟",
  "لية من الاحسن انك متروحش هناك؟",
  "هل المكان ساقع؟",
  "هل في موسيقي شغالة هناك؟",
  "اية الحاجة الغريبة في المكان دة؟",
  "هل تحب تحتفل بعيد ميلادك هناك؟",
  "هل المكان ضلمة؟",
  "هل المكان علي الخريطة؟",
  "بتروح كام مرة هناك؟",
  "هل رحت هناك و انت صغير؟",
  "اية احسن وقت في اليوم اروح هناك؟",
  "هل لو قلت انك كنت هناك الناس هتصدقك؟",
  "هل تحب تقعد هناك وقت اطول؟",
  "هل تحب تستقر هناك؟",
  "هل المكان منور؟",
  "هل تقدر تروح هناك في موعد غرامي؟",
  "هل تقدر تدخن هناك؟",
  "اية الحاجة الجديدة الي ممكن تتعلمها هناك؟",
  "هل ممكن تكون ذكرايات جميلة هناك؟",
  "اقدر اقعد هناك اد اية؟",
  "هتحتاج اية هناك؟",
  "هل اقدر اعمل دوشة هناك؟",
  "هل المكان زحمة؟",
  //"",46
];