import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
String _updatedCity = "Rohtak";
String _updatedState = "Haryana";

class Home extends StatefulWidget {
 
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
     TextEditingController _searchcontroller = new TextEditingController();
 TextEditingController _statecontroller = new TextEditingController();
 TextEditingController _citycontroller = new TextEditingController();
void _update(){
  setState(() {
    if(_statecontroller.toString().isNotEmpty&&_citycontroller.toString().isNotEmpty){
  _updatedCity = _citycontroller.text;
  _updatedState = _statecontroller.text;
    }
  });
}
  @override

  Widget build(BuildContext context) {
   
    
    
  
      
    

    return Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.transparent,
            title: new Text(
              "CoronaGo",
              style: new TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
            ),
            centerTitle: true,
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () {
                  var route =
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new NewScreen();
                  });
                  Navigator.push(context, route);
                },
              )
            ]),
        backgroundColor: Colors.white,
        body: new Container(
            child: new ListView(
          children: <Widget>[
            new Stack(children: <Widget>[
              new ClipPath(
                  clipper: Myclipper(),
                  child: new Container(
                      alignment: Alignment.topCenter,
                      color: Colors.lightBlue,
                      height: 570,
                      width: 480,
                      child: new Image.asset(
                        'images/covidtry1.jpg',
                        fit: BoxFit.fill,
                      ))),
              new Container(
                  margin: const EdgeInsets.only(left: 100.0),
                  padding: const EdgeInsets.only(top: 420.0),
                  alignment: Alignment.center,
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          margin: new EdgeInsets.only(right: 40),
                          child: new Text(
                            "India's",
                            style: new TextStyle(
                              color: Color.fromRGBO(32, 178, 170, 20),
                              fontSize: 65,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        new Container(
                          alignment: Alignment.centerRight,
                          margin: new EdgeInsets.only(
                            right: 20,
                          ),
                          child: new Text(
                            "COVID-19",
                            style: new TextStyle(
                              color: Color.fromRGBO(32, 178, 170, 20),
                              fontSize: 65,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 100, right: 10),
                          child: new Text(
                            "TRACKER",
                            style: new TextStyle(
                                color: Color.fromRGBO(32, 178, 170, 20),
                                fontSize: 45,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ]))
            ]),

            /* new ClipRect(
                                           child : new Container(
                                             color: Colors.transparent,
                                         margin: new EdgeInsets.only(right: 10.0),
                                          // padding: new EdgeInsets.only(top: 10.0 ),
                                           alignment: Alignment.centerLeft,
                                          
                                           child : new Center(child : new Text('"KEEP CALM AND STAY HOME!"',
                                           style : new TextStyle(color: Color.fromRGBO(36, 200, 191, 20),
                                           fontFamily : 'Poppins',
                                           fontSize : 17,
                                           fontWeight : FontWeight.w700)))
                            
                                         
                                         
                                         )
                                         ),*/

            /* new Container(
                                            margin: const EdgeInsets.only(left : 50.0),
                                           padding: const EdgeInsets.only(top: 492.0),
                                           alignment: Alignment.center,
                                            child :  new Row(
                                           mainAxisAlignment : MainAxisAlignment.start,
                                           children: <Widget>[
                                             new Text("Let us all support are ",
                                             style: new TextStyle(color: Colors.grey,
                                             fontFamily: "Poppins",
                                             fontStyle: FontStyle.italic,
                                             fontSize: 18),),
                                             new Text("HEROES!!!",
                                              style : new TextStyle(color : Color.fromRGBO(66, 221 , 212, 20),
                                           fontSize : 40,
                                           fontFamily: "Poppins",
                                           fontWeight : FontWeight.bold)
                                             )
                                           ],
                                         )
                                          )*/
            //STACK ends here
            new Padding(padding: new EdgeInsets.all(20.0)),

            new Padding(padding: new EdgeInsets.all(20.0)),
            worldcases(),
            // new Container(
            //   alignment: Alignment.center,
            //   child: new Container(
            //     alignment: Alignment.center,
            //     decoration: new BoxDecoration(
            //         borderRadius: BorderRadius.circular(10.0),
            //         border: Border.all(
            //           color: Colors.grey,
            //           width: 2,
            //         )),
            //     child: new TextField(
            //         controller: _searchcontroller,
            //         decoration: new InputDecoration(
            //             fillColor: colshade(),
            //             icon: new Icon(Icons.search),
            //             labelText: "Search your city here")),
            //   ),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10.0),
            //       border: Border.all(
            //         color: Color.fromRGBO(32, 178, 170, 20),
            //         width: 2,
            //       )),
            // ),
            new Padding(
              padding: new EdgeInsets.all(20.0),
            ),
            new Container(
                alignment: Alignment.center,
                child: new Center(child : new Text("India's Overall Condition :",
                    style: new TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(32, 178, 170, 20),
                    )))),
                    updateIndiaCases(),
            new Padding(
              padding: new EdgeInsets.all(20.0),
            ),
           new Center(child : new Text("StateWise",
           style: new TextStyle(
             color : colshade(),
             fontFamily : "Poppins",
             fontWeight : FontWeight.bold,
             fontSize : 25
           ))),
           new Padding(
              padding: new EdgeInsets.all(5.0),
            ),
            new Container(
              height: 600,
              width: 480  ,
              alignment: Alignment.center,
              
              child: new Column(children: <Widget>[
                 new TextField(
                  controller: _statecontroller,
                   decoration: new InputDecoration(
                    labelText : "Enter your STATE name",
                    hintText : "First letter Capital for eg: Uttar Pradesh",
                    labelStyle: new TextStyle(color : colshade(),fontFamily : "Poppins"),
                    hintStyle: new TextStyle(fontFamily : "Poppins"),
                    icon : new Icon(Icons.location_searching)

                   )
                ),
                
                new TextField(
                  controller: _citycontroller,
                   decoration: new InputDecoration(
                    labelText : "Enter your city name",
                    hintText : "First letter Capital for eg. North Delhi or Rohtak or Wasseypur :P ",
                    labelStyle: new TextStyle(color : colshade(),fontFamily : "Poppins"),
                    hintStyle: new TextStyle(fontFamily : "Poppins"),
                    icon : new Icon(Icons.location_city)

                   )
                ),
                 new Padding(padding: new EdgeInsets.all(20.0)),
               new Container(

                 child : new Column(
                   children : <Widget>[
                     new RaisedButton(onPressed:(){
                        _update();

                     },child :  new Text("Get Cases",
                     style: new TextStyle(fontFamily : "Poppins")),
                     color: colshade(),
                     ),
                     new Padding(padding: const EdgeInsets.all(10.0)),
                     new Text("$_updatedCity",
                     style: new TextStyle(color: colshade(),
                     fontFamily: "Poppins",
                     fontSize: 25,
                     fontWeight: FontWeight.bold
                     )),
                 
                   ]
                 )
                  
               ),
               new Padding(padding: new EdgeInsets.all(8.0)),

                  updateActiveCases(_updatedState, _updatedCity)
               
                  ]
              
                )
              )]),
            ));

            /* new Container(
                        alignment: Alignment.center,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              height: 120,
                              width: 150,
                              decoration: new BoxDecoration(
                                  border: Border.all(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            new Container(
                              height: 120,
                              width: 100,
                              decoration: new BoxDecoration(
                                  border: Border.all(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            new Container(
                              height: 120,
                              width: 100,
                              decoration: new BoxDecoration(
                                  border: Border.all(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(5.0)),
                            )*/
          
       
  }
}


Future<Map> getCorona() async {
  String apiUrl = "https://api.covid19india.org/state_district_wise.json";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
Future<Map> getCases()async{
  String apiUrl = "https://api.covid19api.com/summary";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
Widget updateIndiaCases(){
  return new FutureBuilder(future: getCases(),
  builder:(BuildContext context, AsyncSnapshot<Map> snapshot){
    if(snapshot.hasData){
      Map content = snapshot.data;
      var a = content["Countries"][101]["TotalConfirmed"] - content["Countries"][101]["TotalRecovered"];
      return new RefreshIndicator(
        child: new Container(
                child: new Column(children: <Widget>[
                  new Container(alignment : Alignment.centerRight,
                  child:  new Text("Last Updated : ${content["Countries"][101]["Date"]}",
                     style: new TextStyle(
                        fontSize: 10,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey
                     ),),),
                     new Row(
                       mainAxisAlignment : MainAxisAlignment.spaceAround,
                       children : <Widget>[
                              new Container(
                height: 190,
                width: 175,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                  ),
                  borderRadius: BorderRadius.circular(5.9),
                  //color: Colors.grey.shade300,
                ),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      
                      new Container(
                          // padding: new EdgeInsets.only(left : 25.0),
                          child: new Center(
                        child: new Text(
                          "Confirmed :",
                          style: new TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      new Padding(padding: new EdgeInsets.all(5.0)),
                       new Text("(+${content["Countries"][101]["NewConfirmed"]})",
                      style : new TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontFamily: "Poppins"
                      )),
                           new Padding(padding: new EdgeInsets.all(1.0)),
                      new Text("${content["Countries"][101]["TotalConfirmed"]}",
                     style: values1(),)
                    ]),
              ),
              new Container(
                height: 190,
                width: 175,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                  ),
                  borderRadius: BorderRadius.circular(5.9),
                  //color: Colors.grey.shade300,
                ),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Container(
                          // padding: new EdgeInsets.only(left : 25.0),
                          child: new Center(
                        child: new Text(
                          "Active :",
                          style: new TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      new Padding(padding: new EdgeInsets.all(15.0)),

                       new Text("$a",
                     style: values1(),)
                    ]),
              ),
                       ]
                     ),
       
             
              
              new Padding(padding: new EdgeInsets.all(10.0)),
              new Row(
                mainAxisAlignment : MainAxisAlignment.spaceAround,
                children : <Widget>[
                         new Container(
                height: 190,
                width: 175,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                  ),
                  borderRadius: BorderRadius.circular(5.9),
                  //color: Colors.grey.shade300,
                ),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Container(
                          // padding: new EdgeInsets.only(left : 25.0),
                          child: new Center(
                        child: new Text(
                          "Recovered :",
                          style: new TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      new Padding(padding: new EdgeInsets.all(5)),
                      new Text("(${content["Countries"][101]["NewRecovered"]})",
                      style : new TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20,
                        fontFamily: "Poppins"
                      )),
                        new Padding(padding: new EdgeInsets.all(1.0)),
                       new Text("${content["Countries"][101]["TotalRecovered"]}",
                     style: values1(),)
                    ]),
              ),
               new Container(
                height: 190,
                width: 175,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                  ),
                  borderRadius: BorderRadius.circular(5.9),
                  //color: Colors.grey.shade300,
                ),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Container(
                          // padding: new EdgeInsets.only(left : 25.0),
                          child: new Center(




                        child: new Text(
                          "Deceased :",
                          style: new TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      new Padding(padding: new EdgeInsets.all(5.0)),
                       new Text("(${content["Countries"][101]["NewDeaths"]})",
                      style : new TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 20,
                        fontFamily: "Poppins"
                      )),
                           new Padding(padding: new EdgeInsets.all(1.0)),
                       new Text("${content["Countries"][101]["TotalDeaths"]}",
                     style: values1(),)
                    ]),
              ),
                ]
              ),
             
              new Padding(padding: new EdgeInsets.all(10.0)),
             
            ])),
             
            onRefresh: ()=>getCases());
    }else{
      return new Container();
    }
  });
}
Widget worldcases(){
  return FutureBuilder(future : getCases(),
  builder: (BuildContext context,AsyncSnapshot<Map> snapshot){
    if(snapshot.hasData){
      Map content = snapshot.data;
      return new Container(
         child:  new Column(
           children : <Widget>[
             new Center(
               child : new Text("AT GLOBAL LEVEL",
               style : new TextStyle(color : colshade(),
               fontSize : 40,
               fontFamily : "Poppins",
               fontWeight : FontWeight.bold)
               )
             ),
             new Container(height: 195,width: 420,
             child: new Image.asset("images/covidtry5.jpg",
             height: 195,width: 420, fit : BoxFit.fill),),
             new Padding(padding: new EdgeInsets.all(10)),
             new Container(
               
               child : new Column(
                 children : <Widget>[
                   new Container(
                     height: 40,
                     width: 480,
                     decoration: new BoxDecoration(
                       borderRadius : BorderRadius.circular(10.2),
                       border : Border.all(
                         color : colshade(),
                         width : 1.25                       ),
                       color : Colors.white
                     ),
                     child :new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   
                         new Text("Total Cases :",
                   style : new TextStyle(
                     color: colshade(),
                     fontFamily: "Poppins",
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   )),
                   new Text("${content["Global"]["TotalConfirmed"]}",
                   style : new TextStyle(

                     fontFamily: "Poppins",
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   )),
                 ]
                   ),
                   ),
                   
                new Padding(padding: new EdgeInsets.all(2.5)),
                  new Container(
                     height: 40,
                     width: 480,
                     decoration: new BoxDecoration(
                       borderRadius : BorderRadius.circular(10.2),
                       border : Border.all(
                         color : colshade(),
                         width : 1.25
                       ),
                       color : Colors.white
                     ),
                     child :new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   
                         new Text("Total Deaths :",
                   style : new TextStyle(
                     color: colshade(),
                     fontFamily: "Poppins",
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   )),
                   new Text("${content["Global"]["TotalDeaths"]}",
                   style : new TextStyle(

                     fontFamily: "Poppins",
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   )),
                 ]
                   ),
                   ),
                  new Padding(padding: new EdgeInsets.all(2.5)),
                  new Container(
                     height: 40,
                     width: 480,
                     decoration: new BoxDecoration(
                       borderRadius : BorderRadius.circular(10.2),
                       border : Border.all(
                         color : colshade(),
                         width : 1.25
                       ),
                       color : Colors.white,
                     ),
                     child :new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   
                         new Text("Total Recoveries :",
                   style : new TextStyle(
                     color: colshade(),
                     fontFamily: "Poppins",
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   )),
                   new Text("${content["Global"]["TotalRecovered"]}",
                   style : new TextStyle(

                     fontFamily: "Poppins",
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   )),
                 ]
                   ),
                   ),
                  
                 ],
               )
             )
           ]
         ),
      );
    }else{
      return new Container();
    }
  });
}
Widget updateActiveCases(String state, String city){
    if(state.isEmpty && city.isEmpty){
      state = "Haryana";
      city = "Rohtak";
    }
  return new FutureBuilder(future : getCorona(),builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
         
         if(snapshot.hasData){
           
           Map content = snapshot.data;
          // List _data = content['$state']['districtData']['$city'];
           return new Container(
                  height: 320,
                  width: 480,
                  child : new ListView(
                  children : <Widget>[
                    new Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children : <Widget>[
                        new Container(
                          width: 175,height: 120,
                        decoration: new BoxDecoration(
                          borderRadius : BorderRadius.circular(10.2),
                          border: Border.all(
                            color : Colors.black26,
                            width : 2.5
                          ),
                          color: Colors.redAccent.shade700
                          
                        ),
                        child : new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children : <Widget>[new Text("Active",
                        style: box(),),
                           new Text("${content['$state']['districtData']['$city']["active"]}",
                           style: values() ,)
                          ]),

                        ),
                           new Container(width: 175,height: 120,
                        decoration: new BoxDecoration(
                          borderRadius : BorderRadius.circular(10.2),
                          border: Border.all(
                            color : Colors.black26,
                            width : 2.5
                          ),
                          color: Colors.blue.shade700
                          
                        ),
                        child : new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children : <Widget>[new Text("Recovered",
                        style: box(),),
                           new Text("${content['$state']['districtData']['$city']["recovered"]}",
                           style: values() ,)
                          ]),

                        ),
                        ]
                    ),
                    new Padding(padding: new EdgeInsets.all(10.002)),
                    new Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children : <Widget>[
                        new Container(width: 175,height: 120,
                        decoration: new BoxDecoration(
                          borderRadius : BorderRadius.circular(10.2),
                          border: Border.all(
                            color : Colors.black26,
                            width : 2.5
                          ),
                          color: Colors.purple.shade900
                          
                        ),
                        child : new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children : <Widget>[new Text("Deceased",
                        style: box(),),
                           new Text("${content['$state']['districtData']['$city']["deceased"]}",
                           style: values() ,)
                          ]),


                        ),
                           new Container(width: 175,height: 120,
                        decoration: new BoxDecoration(
                          borderRadius : BorderRadius.circular(10.2),
                          border: Border.all(
                            color : Colors.black26,
                            width : 2.5
                          ),
                          color: colshade()
                          
                        ),
                        child : new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children : <Widget>[new Text("Confirmed",
                        style: box(),),
                           new Text("${content['$state']['districtData']['$city']["confirmed"]}",
                           style: values() ,)
                          ]),

                        ),
                        ]
                    )]));
               
         }else{
           return Text(" Please Enter! ",
           style:  new TextStyle(color : colshade(),
           fontFamily : "Poppins"),);
         }
  }
  );
}

//NEW SCREEN BC

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text(
            "FAQ's",
            style: new TextStyle(fontFamily: "Poppins"),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          // actions: <Widget>[
          //   new IconButton(
          //       icon: new Icon(Icons.help), onPressed: () {
          //         var route =
          //             new MaterialPageRoute(builder: (BuildContext context) {

          //           return new AboutMe();
          //         }
          //         );
          //         Navigator.push(context, route);
          //       },)
          // ],
        ),
        body: new Container(
            child: new ListView(children: <Widget>[
          new Stack(children: <Widget>[
            new Container(
                child: new ClipPath(
                    clipper: Myclipper(),
                    child: new Container(
                        alignment: Alignment.topCenter,
                        color: Colors.black,
                        height: 570,
                        width: 480,
                        child: new Image.asset(
                          'images/covidtry2.jpg',
                          fit: BoxFit.fill,
                        )))),
            new Container(
                margin: const EdgeInsets.only(left: 180, top: 398),
                alignment: Alignment.centerRight,
                child: new Text("Some FAQ's\nrelated to COVID-19",
                    style: new TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 40,
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.w700))),
          ]),
          new Padding(padding: new EdgeInsets.all(20.0)),
          new Container(
              child: new Column(
            children: <Widget>[
              new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    new Container(
                      alignment: Alignment.centerLeft,
                      child: new Text("What is Corona virus?", style: faq1()),
                    ),
                    new Padding(padding: new EdgeInsets.only(left: 90)),
                    new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.2)),
                                  title: new Text("What is Corona virus?",
                                      style: ques()),
                                  children: <Widget>[
                                    new Divider(color: Colors.grey),
                                    new Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: new Text(
                                          "Coronaviruses are a large family of viruses which may cause illness in animals or humans.  In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19.",
                                          style: faq1()),
                                    ),
                                  ],
                                );
                              });
                        })
                  ])),
              new Divider(),
              new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    new Text("What is Covid-19?", style: faq1()),
                    new Padding(padding: new EdgeInsets.only(left: 120)),
                    new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.2)),
                                  title: new Text("What is Covid-19?      ",
                                      style: ques()),
                                  children: <Widget>[
                                    new Divider(color: Colors.grey),
                                    new Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: new Text(
                                          "COVID-19 is the infectious disease caused by the most recently discovered coronavirus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019.",
                                          style: faq1()),
                                    ),
                                  ],
                                );
                              });
                        })
                  ])),
              new Divider(),
              new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    new Container(
                        alignment: Alignment.centerLeft,
                        child: new Text("What are symptoms of Covid-19?",
                            style: faq1())),
                    new Padding(padding: new EdgeInsets.only(left: 10)),
                    new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.2)),
                                  title: new Text(
                                      "What are symptoms of Covid-19?",
                                      style: ques()),
                                  children: <Widget>[
                                    new Divider(color: Colors.grey),
                                    new Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: new Text(
                                          "The most common symptoms of COVID-19 are fever, tiredness, and dry cough. Some patients may have aches and pains, nasal congestion, runny nose, sore throat or diarrhea. These symptoms are usually mild and begin gradually. Some people become infected but don’t develop any symptoms and don't feel unwell. Most people (about 80%) recover from the disease without needing special treatment. Around 1 out of every 6 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart problems or diabetes, are more likely to develop serious illness. People with fever, cough and difficulty breathing should seek medical attention.",
                                          style: faq1()),
                                    ),
                                  ],
                                );
                              });
                        })
                  ])),
              new Divider(),
              new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    new Text("How does Covid-19 spread?", style: faq1()),
                    new Padding(padding: new EdgeInsets.only(left: 45)),
                    new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.2)),
                                  title: new Text("How does Covid-19 spread?",
                                      style: ques()),
                                  children: <Widget>[
                                    new Divider(color: Colors.grey),
                                    new Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: new Text(
                                          "People can catch COVID-19 from others who have the virus. The disease can spread from person to person through small droplets from the nose or mouth which are spread when a person with COVID-19 coughs or exhales. These droplets land on objects and surfaces around the person. Other people then catch COVID-19 by touching these objects or surfaces, then touching their eyes, nose or mouth. People can also catch COVID-19 if they breathe in droplets from a person with COVID-19 who coughs out or exhales droplets. This is why it is important to stay more than 1 meter (3 feet) away from a person who is sick.",
                                          style: faq1()),
                                    ),
                                  ],
                                );
                              });
                        })
                  ])),
              new Divider(),
              new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    new Text("How likely am I to catch COVID-19?",
                        style: faq1()),
                    new Padding(padding: new EdgeInsets.only(left: 10)),
                    new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.2)),
                                  title: new Text(
                                      "How likely am I to catch COVID-19? ",
                                      style: ques()),
                                  children: <Widget>[
                                    new Divider(color: Colors.grey),
                                    new Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: new Text(
                                          "The risk depends on where you  are - and more specifically, whether there is a COVID-19 outbreak unfolding there",
                                          style: faq1()),
                                    ),
                                  ],
                                );
                              });
                        })
                  ])),
              new Divider(),
              new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    new Text("Should I worry about COVID-19?", style: faq1()),
                    new Padding(padding: new EdgeInsets.only(left: 20)),
                    new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.2)),
                                  title: new Text(
                                      "Should I worry about COVID-19? ",
                                      style: ques()),
                                  children: <Widget>[
                                    new Divider(color: Colors.grey),
                                    new Padding(
                                        padding: new EdgeInsets.all(6.5)),
                                    new Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: new Text(
                                          "Illness due to COVID-19 infection is generally mild, especially for children and young adults. However, it can cause serious illness: about 1 in every 5 people who catch it need hospital care. It is therefore quite normal for people to worry about how the COVID-19 outbreak will affect them and their loved ones.",
                                          style: faq1()),
                                    ),
                                  ],
                                );
                              });
                        })
                  ])),
              new Divider(),
              new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    new Text(
                        "What can I do to protect myself\nand prevent the spread of disease?",
                        style: faq1()),
                    new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.2)),
                                  title: new Text(
                                      "What can I do to protect myself and prevent the spread of disease? ",
                                      style: ques()),
                                  children: <Widget>[
                                    new Divider(color: Colors.grey),
                                    new Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: new Text(
                                          "You can reduce your chances of being infected or spreading COVID-19 by taking some simple precautions:\nRegularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water\nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.\n",
                                          style: faq1()),
                                    ),
                                  ],
                                );
                              });
                        })
                  ])),
              new Divider(),
              new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    new Text("Should I wear mask to protect myself?",
                        style: faq1()),
                    new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.2)),
                                  title: new Text(
                                      "Should I wear mask to protect myself?",
                                      style: ques()),
                                  children: <Widget>[
                                    new Divider(color: Colors.grey),
                                    new Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: new Text(
                                          "Only wear a mask if you are ill with COVID-19 symptoms (especially coughing) or looking after someone who may have COVID-19. Disposable face mask can only be used once. If you are not ill or looking after someone who is ill then you are wasting a mask. There is a world-wide shortage of masks, so WHO urges people to use masks wisely.",
                                          style: faq1()),
                                    ),
                                  ],
                                );
                              });
                        })
                  ])),
                  new Padding(padding: new EdgeInsets.all(20.0)),
                  new RaisedButton(onPressed: (){
                       var route =
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new AboutMe();
                  });
                  Navigator.push(context, route);
                  },
                  color: Colors.orange.shade700,
                  child: new Text("ABOUT ME",
                  style : new TextStyle(
                    color : Colors.white,
                    fontFamily : "Poppins",
                  
                  ),)
                  )],
          ))
        ])));
  }
}
                                                //ABOUT ME PAGE LUNSOP
                                                class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title : new Text("About Me",
        style : new TextStyle(fontSize: 20,
        fontFamily: "Poppins"),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent
      ),
      backgroundColor: Colors.white,
      body: 
         new ListView(
          children: <Widget>[
            new Stack(
              children : <Widget>[
                new Image.asset("images/flower.jpg",
                height : 800,
                width : 400,
                fit : BoxFit.cover),
                     new ClipPath(
              clipper : MyClipper2(),
              child : new Container(color:Colors.grey.shade200,height: 700,width: 500,)
            ),
            new Container(
              alignment : Alignment.center,
              child : new Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                     new Container(margin: const EdgeInsets.fromLTRB(0.0, 175, 0, 0.0),
                 child : new CircleAvatar(
                    backgroundImage : new AssetImage("images/garvitt.jpg"),
                    radius: 100.0,
                  ),),
                  new Padding(padding: const EdgeInsets.all(10.0)),
                  new Container(
                   child: new Center(
                         child:  new Text("GARVIT SHARMA",
                          style : new TextStyle(
                      color : Colors.black,
                      fontFamily : "Poppins",
                      fontWeight : FontWeight.bold,
                      fontSize : 30),)
                   )
                   

                  
                  ),
                          
                    
                  
                new Padding(padding: new EdgeInsets.all(5.0)),
                new Column(
                  children : <Widget>[
                   new Center(child : new Text("Computer Engineer",
                    style : new TextStyle(
                      color : Colors.blueGrey,
                      fontFamily : "Poppins",
                      fontSize : 18
                    ))),
                        new Center(child : new Text("Thapar Institute of Engineering",
                    style : new TextStyle(
                      color : Colors.blueGrey,
                      fontFamily : "Poppins",
                      fontSize : 18
                    ))),
                  ]
                )
                //  new Container(
                //    margin: const EdgeInsets.fromLTRB(0.0, 120, 0.0, 0.0),
                //    height : 300,
                //    width: 250,
                //    decoration : new BoxDecoration(color: Colors.white,
                //      borderRadius : BorderRadius.circular(10.2),
                //      border: Border.all(
                //        color : Colors.white,
                //        width : 3
                //      )
                //    ),
                //    child : new Image.asset("images/garvitt.jpg",
                //    height: 299,
                //    width: 299,
                //    fit: BoxFit.fill,)
                //  )
              ],)
            )
              ]
            ),
            
          ],)
      
    );
  }
}
class MyClipper2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width,0);
      var firstControllPoint = Offset(size.width-50, 105);
    var firstEndPoint = Offset(size.width / 2 + 30, 90);
    path.quadraticBezierTo(firstControllPoint.dx, firstControllPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
         var firstControllPoint1 = Offset(80, 85);
    var firstEndPoint1 = Offset(0, size.height / 2 -125);
    path.quadraticBezierTo(firstControllPoint1.dx, firstControllPoint1.dy,
        firstEndPoint1.dx, firstEndPoint1.dy);
      path.lineTo(0, size.height-25);
      var firstControllPoint2 = Offset(80.0, size.height - 170);
    var firstEndPoint2 = Offset(size.width / 2 + 30, size.height / 2 + 185);
    path.quadraticBezierTo(firstControllPoint2.dx, firstControllPoint2.dy,
        firstEndPoint2.dx, firstEndPoint2.dy);
    var secondControllPoint = Offset(size.width - 50, size.height / 2 + 200);
    var secondEndPoint = Offset(size.width, size.height / 2+100);
    path.quadraticBezierTo(secondControllPoint.dx, secondControllPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
    
}

TextStyle faq() {
  return TextStyle(
      fontSize: 20,
      fontFamily: "Poppins",
      color: Color.fromRGBO(32, 178, 170, 20));
}

TextStyle faq1() {
  return TextStyle(
      fontSize: 20, fontFamily: "Poppins", color: Colors.orange.shade700);
}

TextStyle ques() {
  return TextStyle(fontSize: 20, fontFamily: "Poppins", color: Colors.black);
}

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    var firstControllPoint = Offset(10.0, size.height - 150);
    var firstEndPoint = Offset(size.width / 2 + 30, size.height / 2 + 85);
    path.quadraticBezierTo(firstControllPoint.dx, firstControllPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControllPoint = Offset(size.width - 60, size.height / 2 + 70);
    var secondEndPoint = Offset(size.width, size.height / 2 - 50);
    path.quadraticBezierTo(secondControllPoint.dx, secondControllPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Color colshade() {
  return Color.fromRGBO(32, 178, 170, 20);
}

TextStyle box(){
  return TextStyle(
   color: Colors.white,
   fontFamily: "Poppins",
   fontWeight: FontWeight.bold,
   fontSize: 25.0  );
}
TextStyle values(){
  return TextStyle(
   color : Colors.white,
   fontFamily: "Poppins",
   fontSize: 18
  );
}
TextStyle values1(){
  return TextStyle(
   color : colshade(),
   fontFamily: "Poppins",
   fontSize: 30,
   fontWeight: FontWeight.bold
  );
}