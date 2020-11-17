import 'package:animationui/detailed_imageview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedImageView extends StatefulWidget{
  final String imageName;
  final double height,width;
  AnimatedImageView({this.imageName,this.height,this.width});

  @override
  AnimatedImageState createState()=>AnimatedImageState();
}

class AnimatedImageState extends State<AnimatedImageView>{
  double _height=250,_width=250;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //This method used to change the width and height of the image when user clicks the back button
  changeUi(){
    setState(() {
      _width=250;
      _height=250;
    });
  }


  @override
  Widget build(BuildContext context){
    return Container(
      width: 250,
      height: 250,
      alignment: Alignment.center,
      child: GestureDetector(
          onTap: (){
            _width=200;
            _height=200;
            setState(() {});
            Future.delayed(Duration(seconds: 3), () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedImageView(widget.imageName,changeUi)));
            });
          },
        child: AnimatedContainer(
          margin: EdgeInsets.all(10),
          width: _width,
          height: _height,
          duration: Duration(seconds: 2),
          child:GestureDetector(
            child: Hero(
              tag: widget.imageName,//tag name must be unique for all images
              child: Image(
                image: AssetImage(
                    widget.imageName
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}