import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/iconcont.dart';
import '../components/reusablecode.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
enum Gender{
  female,
  male,
}




class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedgender;
  Color malecolor=kinnactivecolor;
  Color femalecolor=kinnactivecolor;
  int height=180;
  int weight=60;
  int age=19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:Row(
          children: <Widget>[
            Expanded(child:reusablecode(onpress: (){setState(() {
              selectedgender=Gender.male;
            });},colour:selectedgender==Gender.male?kactivecolor:kinnactivecolor, cardchild:iconcontents(icon: FontAwesomeIcons.mars,label: 'MALE',)) ,),

            Expanded(child:reusablecode(onpress:(){setState(() {
              selectedgender=Gender.female;
            });},colour:selectedgender==Gender.female?kactivecolor:kinnactivecolor,cardchild:iconcontents(icon: FontAwesomeIcons.venus,label: 'FEMALE')),),
        ]
          )),
          Expanded( child:reusablecode( colour:kactivecolor,cardchild:Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text('HEIGHT',style: klabeltextstyle,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                Text(height.toString(),style:knumbertextstyle),
                Text('cm',style: klabeltextstyle,),
              ],),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbColor: Color(0xFFEB1555),
                  activeTrackColor: Colors.white,
                  overlayColor:Color(0x29EB1555) ,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: height.toDouble(),
                  min:120,
                  max: 220,


                  onChanged: (double newvalue){
                    setState(() {
                      height=newvalue.round();
                    });
                  },
                ),
              ),
            ],
          ))),
          Expanded(child:Row(
              children: <Widget>[
                Expanded(child:reusablecode(colour:kactivecolor,cardchild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text('WEIGHT',style: klabeltextstyle,),
                    Text(weight.toString(),style:knumbertextstyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                       roundshapedbutton(icon:FontAwesomeIcons.minus,onpressed: (){
                         setState(() {
                           weight--;
                         });
                       },),
                        SizedBox(
                          width: 10.0,
                        ),
                          roundshapedbutton(icon:FontAwesomeIcons.plus,onpressed: (){
                            setState(() {
                              weight++;
                            });
                         }
                          ),

                      ],
                    ),
                  ],
                ))),
                Expanded(child:reusablecode(colour:kactivecolor,cardchild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text('AGE',style: klabeltextstyle,),
                    Text(age.toString(),style:knumbertextstyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        roundshapedbutton(icon:FontAwesomeIcons.minus,onpressed: (){
                          setState(() {
                            age--;
                          });
                        },),
                        SizedBox(
                          width: 10.0,
                        ),
                        roundshapedbutton(icon:FontAwesomeIcons.plus,onpressed: (){
                          setState(() {
                            age++;
                          });
                        }
                        ),

                      ],
                    ),
                  ],
                ))),
              ]
          )),
          bottombutton(buttontitle: "CALCULATE",ontap:(){
            calculatorbrain calc= calculatorbrain(
              height: height,weight: weight,age:age,gend: selectedgender
            );

            Navigator.push(context, MaterialPageRoute(builder:(context)=>resultspage(
              bmiresult:calc.calculatebmi(),
              resulttext: calc.Getresult(),
              interpretation: calc.getInterpretation(),
            )));
          },),
        ],

      )

    );
  }
}




