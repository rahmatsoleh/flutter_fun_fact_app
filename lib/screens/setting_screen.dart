import 'package:flutter/material.dart';
import 'package:fun_fact_app/widgets/theme_switcher.dart';

class SettingScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(children: [ThemeSwitcher()]),
    );
  }
}
