import 'package:flutter/material.dart';
import 'package:fun_fact_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const new({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Theme Mode",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Switch(
                value: themeProvider.isDarkModeChecked,
                onChanged: (val) {
                  themeProvider.changeTheme();
                },
              ),
              SizedBox(width: 4),
              Text(themeProvider.isDarkModeChecked ? "Dark" : "Light"),
            ],
          ),
        ],
      ),
    );
  }
}
