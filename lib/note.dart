import 'package:flutter/material.dart';

class Note{
  String text;
  String text_name;


  Note(this.text, this.text_name);

  Note.fromJson(Map<String, dynamic> json){
    text_name = json['text_name'];
    text = json['text'];
  }
}