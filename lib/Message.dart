import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:http/http.dart' as http;

// Create a session named after the class.
part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  // Factory is a way to say that the constructor returns a function..
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  // Create a Future method called browse wich returns _message;
  static Future<List<Message>> browse({ status = 'important' }) async {
    // http.Response response = await http
    //     .get('https://run.mocky.io/v3/ebea9b0a-481d-4db6-bccc-0b9b2a08a7af');

    String response = await rootBundle.loadString('data/messages.json');

    await Future.delayed(Duration(seconds: 1));
    // String content = response.body;
    String content = response;
    List collection = json.decode(content);

    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}
