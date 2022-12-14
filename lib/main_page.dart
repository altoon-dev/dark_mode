import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_translator/universal_translator.dart';
import 'note.dart';

class Home extends StatefulWidget {
  final togglecall;
  const Home({Key? key, this.togglecall}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String translated = 'Translation';
  Note note = Note();
  String path = "https://nlp-translation.p.rapidapi.com/v1/translate";
  Map<String,dynamic> headers = { "x-rapidapi-key": "MY_API_KEY" }
// //starts
//   String responsePattern(Response response) {
//     if (response.statusCode == 200 && response.data['status'] == 200) {
//       dynamic data = response.data;
//       return data["translated_text"][data["to"]];
//     }
//     return null;
//   }
//
//   Map<String,dynamic> bodyPattern(String text, Locale to) => {
//     "text": text,
//     "to": to.toLanguageTag(),
//     "from": "pt"
//   };
  //ends

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      note = Note.fromJson(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${note.textName}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.toggle_on_outlined,
                    color: Color(
                      0xFF339ECD,
                    ),
                    size: 40,
                  ),
                  onPressed: widget.togglecall,
                ),
              IconButton(
                  icon: const Icon(
                    Icons.bedtime_outlined,
                    color: Color(0xFF6B6B6B),
                    size: 40,
                  ),
                  onPressed: (() {
                    widget.togglecall;
                    })
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Color(0xFFEBEBEB),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: readJson(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '${note.text}',
                          style: const TextStyle(
                            color: Color(0xFF575767)
                          ),
                        ).translate(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
