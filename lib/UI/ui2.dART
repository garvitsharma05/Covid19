import 'package:flutter/material.dart';
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
        backgroundColor: Colors.indigo,
      ),
      body: 
         new ListView(
          children: <Widget>[
            new Stack(
              children : <Widget>[
                     new ClipPath(
              clipper : MyClipper2(),
              child : new Container(color:Colors.grey.shade200,height: 700,width: 500,)
            ),
            new Container(
              alignment : Alignment.center,
              child : new Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 new Container(
                   height : 300,
                   width: 250,
                   decoration : new BoxDecoration(color: Colors.white,
                     borderRadius : BorderRadius.circular(10.2),
                     border: Border.all(
                       color : Colors.white,
                       width : 3
                     )
                   ),
                   child : new Image.asset("images.garvitt.jpg",
                   height: 299,
                   width: 249,)
                 )
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