import 'package:flutter/material.dart';
import 'package:flutter_application_myapp/page/form.dart';
import 'package:flutter_application_myapp/model/to_do.dart';
import 'package:flutter_application_myapp/page/to_do_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<ToDo>> fetchToDo() async {
        var url = Uri.parse('https://jsonplaceholder.typicode.com/todos?_start=0&_limit=10');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object ToDo
        List<ToDo> listToDo = [];
        for (var d in data) {
        if (d != null) {
            listToDo.add(ToDo.fromJson(d));
        }
        }

        return listToDo;
    }