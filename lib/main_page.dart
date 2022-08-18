import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  var togglecall;
  Home({this.togglecall});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Text Name", style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),),
          Center(
            child: IconButton(
              icon: Icon(Icons.toggle_on_outlined, color: Color(0xFF339ECD,),
                size: 40,),
              onPressed: widget.togglecall,
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(Icons.bedtime_outlined, color: Color(0xFF6B6B6B),
                size: 40,),
              onPressed: widget.togglecall,
            ),
          ),
          SizedBox(height: 20.0,
            width: 150.0,
            child: Divider(
              color: Color(0xFFEBEBEB),
            ),),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context,i){
                  return Card(child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("$i Card"),
                  ),);
                }),
          ),
        ],
      ),
    );
  }
}