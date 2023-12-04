import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snapchat/src/app_state.dart';
import 'package:snapchat/src/res/routes/routes.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _username = "";
  bool nightmode = true;
  @override
  void initState() {
    super.initState();
    getInitialData();
  }

  getInitialData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString("USERNAME");
    setState(() {
      _username = username ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 88,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 44,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).colorScheme.onBackground,
                            size: 24,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text('Settings',
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'My account',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'User name',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          _username,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color(0xFFA7ACAF),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'More',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    height: 76,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Night mode',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Switch(
                            inactiveTrackColor:
                                Theme.of(context).colorScheme.primary,
                            activeTrackColor: const Color(0xFFC5C9CC),
                            value: appState.isDarkMode,
                            onChanged: (bool value) {
                              appState.updateTheme(value);
                            })
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.termsAndConditions);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      height: 76,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Terms and conditions',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.privacyAndPolicy);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      height: 76,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Privacy and policy',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
