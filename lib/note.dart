import 'package:flutter/material.dart';

class Note{
  String text;
  String title_text;


  Note(this.text, this.title_text);

  Note.fromJson(Map<String, dynamic> json){
    title_text = json['title_text'];
    text = json['text'];
  }
}