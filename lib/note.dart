import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Note {
  String? textName;
  String? text;

  Note({this.textName, this.text});

  Note.fromJson(Map<String, dynamic> json){
    textName = json['text_name'];
    text = json['text'];
  }
}
