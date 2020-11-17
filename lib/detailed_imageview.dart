import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailedImageView extends StatefulWidget{
  String imageName;
  Function function;
  DetailedImageView(this.imageName,this.function);

  @override
  _DetailedImageState createState()=>_DetailedImageState();

}

class _DetailedImageState extends State<DetailedImageView>{
  String nature1="“I declare this world is so beautiful that I can hardly believe it exists.” The beauty of nature can have a profound effect upon our senses, those gateways from the outer world to the inner, whether it results in disbelief in its very existence as Emerson notes, or feelings such as awe, wonder, or amazement.";
  String nature2="Nature, in the broadest sense, is the natural, physical, or material world or universe. ... The word nature is derived from the Latin word natura, or essential qualities, innate disposition, and in ancient times, literally meant birth";
  double _opacity=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        _opacity=1.0;
      });
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("DetailedImageView",style: TextStyle(color: Colors.white),),automaticallyImplyLeading: false,),
      body: WillPopScope(
        onWillPop: (){
          widget.function();
          Navigator.pop(context);
          },
        child:SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Hero(
                    tag: widget.imageName,//tag name must be unique for all images
                    child: Image(
                      image: AssetImage(widget.imageName),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child: Text("About",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 20,),
                Container(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500 ),
                    opacity: _opacity,
                    child: Text(nature1,style: TextStyle(fontSize: 18),),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: _opacity,
                    child: Text(nature2,style: TextStyle(fontSize: 18),),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ) ,
      )
    );
  }

}