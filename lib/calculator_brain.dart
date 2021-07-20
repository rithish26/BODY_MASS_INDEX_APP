import 'dart:math';
import 'screens/input_page.dart';
class calculatorbrain{
  calculatorbrain({this.height,this.weight,this.age,this.gend});
  final int height;
  final int weight;
  final int age;
  final Gender gend;
  double _bmi;
  String calculatebmi()
  {
    if(gend==null)
    {
      return 'SELECT GENDER';
    }
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);

  }

String Getresult()
{
  if(gend==null)
  {
    return '';
  }
  if(age>=65)
    {
      if(_bmi>31)
      {
        return 'Overweight';
      }
      if(_bmi>=23)
      {
        return 'Normal';
      }
      if(_bmi<23)
        {
          return 'Underweight';
        }


    }
  else {

    if (_bmi >= 25) {
      return 'Overweight';
    }
    else if (_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }
}
String getInterpretation()
{
  if(age>=65)
  {
    if(gend==null)
    {
      return '';
    }
    if(_bmi>31)
    {
      return 'You have Higher Than Normal normal body weight, Please pay a visit to the doctor.';
    }
    else if(_bmi>=23)
    {
      return 'You have a Normal body Weight, GOOD JOB!';
    }
    else if(_bmi<23)
    {
      return 'You have lower than normal body weight,Please pay a visit to the doctor';
    }


  }
  if(age<=19)
    {
      if(gend==null)
        {
          return '';
        }
   if(gend==Gender.female) {
     if (_bmi >= 25) {
       return 'You have Higher Than Normal normal body weight, Try to exercise more.';
     }
     else if (_bmi > 18.5) {
       return 'You have a Normal body Weight, GOOD JOB!';
     }
     else {
       return 'You have lower than normal body weight,you should eat more!';
     }
   }

    else if(gend==Gender.male)
    {

      if (_bmi >= 25) {
        return 'You have Higher Than Normal normal body weight, Try to exercise more.';
      }
      else if (_bmi > 18.5) {
        return 'You have a Normal body Weight, GOOD JOB!';
      }
      else {
        return 'You have lower than normal body weight,you should eat more!';
      }

  }
    }
  if(age>19) {
    if(gend==null)
    {
      return '';
    }
      if (_bmi >= 25) {
        return 'You have Higher Than Normal normal body weight, Try to exercise more.';
      }
      else if (_bmi > 18.5) {
        return 'You have a Normal body Weight, GOOD JOB!';
      }
      else {
        return 'You have lower than normal body weight,you should eat more!';
      }




  }
}

}