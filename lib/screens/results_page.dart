import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusablecode.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
class resultspage extends StatelessWidget {

  resultspage({@required this.bmiresult,@required this.resulttext,@required this.interpretation});

  final String bmiresult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('YOUR RESULT',style:ktittle)
          )),
          Expanded(flex: 5,child: reusablecode(
            colour: kactivecolor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resulttext.toUpperCase(),style:kresulttext),
                Text(bmiresult,style:kbmitext),
                Text(interpretation,textAlign: TextAlign.center,style:kbodytext)

              ],
            ),
          ),),
          bottombutton(buttontitle:'RE-CALCULATE',ontap: (){
            Navigator.pop(context);
    }
          )
        ],
      ),
    );
  }
}
