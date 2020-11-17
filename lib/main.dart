import 'package:animationui/animated_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> imageName=["Blue","Cloud","Green","Leaves","Water","Yellow"];
  List<String> images=["assets/images/blue.jpeg","assets/images/cloud.jpg","assets/images/green.jpg","assets/images/leaves.jpeg","assets/images/water.jpeg","assets/images/yellow.jpeg"];
  List<String> tagName=["1","2","3","4","5","6","7"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation UI",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: imageName.length,
          itemBuilder: (context,index){
            return AnimatedImageView(imageName: images[index],height: 250,width: 250,);
          },
        ),
      )
    );
  }
}
