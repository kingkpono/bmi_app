import "package:flutter/material.dart";

class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
      return new HomeState();
  }
}

class HomeState extends State<Home>{
  final TextEditingController _ageFieldController = new TextEditingController();
  final TextEditingController _weightFieldController = new TextEditingController();
  final TextEditingController _heightFieldController = new TextEditingController();
  double bmi=0.0;
  String _displayText="";
  String _weightStatus="";

  void _calculate(){
    setState((){

      if(_ageFieldController.text.isNotEmpty && _heightFieldController.text.isNotEmpty && _weightFieldController.text.isNotEmpty )
      {
        int age=int.parse(_ageFieldController.text);
        double height=double.parse(_heightFieldController.text);
        double weight=double.parse(_weightFieldController.text);

        double bmi=weight/(height*height);
        _displayText="Your BMI: "+bmi.toString();

        //determine weight status


        if(bmi > 30)
          _weightStatus="Obese";
        else if(bmi > 24.9 && bmi < 30)
          _weightStatus="Overweight";
        else if(bmi > 18.5 && bmi< 25)
          _weightStatus="Normal Weight";
        else if(bmi < 18.5)
          _weightStatus="Underweight";
      }else{
        _displayText="Enter age, height and width";
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
       appBar: new AppBar(
            title: new Text("BMI"),
            centerTitle: true,
            backgroundColor: Colors.red,

       ),

      body: new Container(
          alignment: Alignment.topCenter,

          child: new ListView(
               children: <Widget>[
                 
                 new Image.asset(
                     "images/bmilogo.png",
                   height: 100.0,
                   width: 200.0,
                 ),
               new Container(
                   height: 400.0,
                   width: 380.0,
                   color: Colors.white,

                   child:
                      new Column(
                        
                     children: <Widget>[
                       new TextField(
                         controller: _ageFieldController,
                         keyboardType: TextInputType.number,
                         decoration: new InputDecoration(icon: new Icon(Icons.person), hintText: "Age"),
                       ),
                       new TextField(
                         controller: _heightFieldController,
                         keyboardType: TextInputType.number,
                         decoration: new InputDecoration(icon: new Icon(Icons.assessment), hintText: "Height in feet"),
                       ),
                       new TextField(
                         controller: _weightFieldController,
                         keyboardType: TextInputType.number,
                         decoration: new InputDecoration(icon: new Icon(Icons.line_weight), hintText: "Weight in lb"),
                       ),
                       new Padding(padding: const EdgeInsets.only(top:10.0)),
                       new Container(
                          margin: EdgeInsets.only(left: 10.0),
                         
                         child: new RaisedButton( 
                           onPressed: _calculate,
                           color: Colors.red,
                            child: new Text("Calculate", style: new TextStyle(color: Colors.white),)
                         ),
                       ),

                       new Column(
                         children: <Widget>[
                           new Text(_displayText,
                             style: new TextStyle(color: Colors.lightBlue,
                                 fontSize: 19.4,
                                 fontStyle: FontStyle.italic,
                                 fontWeight: FontWeight.w500),

                           ),
                           new Padding(padding: const EdgeInsets.only(top:5.0)),
                           new Text(_weightStatus,
                             style: new TextStyle(color: Colors.red,
                                 fontSize: 19.4,
                                 fontWeight: FontWeight.w500),

                           )
                         ],

                       ),

                   ],
                 )
               ),
               ],
          )

      ),
    );


  }


}