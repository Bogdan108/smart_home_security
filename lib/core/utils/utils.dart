import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void setColor(Color color, String selectedDevice) async {
  try {
    var res = await http.post(
      Uri.http('$selectedDevice', '/colour'),
      body: {
        "r": color.red.toString(),
        "g": color.green.toString(),
        "b": color.blue.toString()
      },

      //  headers: {  "Content-type": "text/html"}
    );
    if (res.statusCode != 200) {
      //TODO убрать из функций принты
      print("Ошибка отправки запроса");
    } else {
      //TODO убрать из функций принты
      print(res.statusCode);
    }
  } catch (e) {
    //TODO убрать из функций принты
    print(e);
  }
}
