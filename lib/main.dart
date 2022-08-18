import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_page.dart';
import 'package:http/http.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int thememode = 1;


  @override
  void initState() {
    super.initState();
  }

  starting()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getInt("thememode")!=null ){
      thememode = pref.getInt("thememode")!;
    }else{
      pref.setInt("thememode", thememode );
    }
    setState(() {

    });

  }
  toggletheme()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getInt("thememode")==1 ){
      pref.setInt("thememode", 0 );
      thememode = 0;
    }else{
      pref.setInt("thememode", 1 );
      thememode = 1;
    }
    setState(() {

    });
  }
  Future fetchNotes() async {

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(togglecall: toggletheme,),
      theme: ThemeData(
          primaryColor: Colors.red,
          cardColor: Colors.white
      ),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.black45,
          cardColor: Colors.black87
      ),
      themeMode: thememode==1? ThemeMode.dark:ThemeMode.light,
    );
  }
}