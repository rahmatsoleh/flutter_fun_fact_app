import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fun_fact_app/screens/setting_screen.dart';
import 'package:dio/dio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> facts = [];
  bool isLoading = true;

  Future<void> getData() async {
    String url =
        "https://raw.githubusercontent.com/sujandstc/flutter_dummy_data/refs/heads/main/fun_facts.json";

    try {
      Response response = await Dio().get(url);

      setState(() {
        facts = jsonDecode(response.data);
        isLoading = false;
      });
    } catch (e) {
      print(e);
      isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fun Facts"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: facts.length,
                    itemBuilder: (context, int index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            facts[index],
                            style: TextStyle(fontSize: 36),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text("Swipe left for more"),
                ),
              ],
            ),
    );
  }
}
