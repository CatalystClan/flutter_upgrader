import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_upgrader/flutter_mobile_upgrader.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Upgrader Plugin'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButtonTheme.of(context).style,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      '升 级',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onPressed: () {
                    final Future<AppUpgradeInfo> appUpgradeInfo = Future.value(
                      AppUpgradeInfo(
                          title: '更新提示',
                          contents: ['有新版本哟,请更新～'],
                          force: false,
                          apkDownloadUrl: ''),
                    );

                    if (Platform.isAndroid) {
                      AppUpgradeManager.upgrade(
                        context,
                        appUpgradeInfo,
                      );
                    }

                    if (Platform.isIOS) {
                      AppUpgradeManager.upgrade(
                        context,
                        appUpgradeInfo,
                        iosAppId: 'idxxxxxx',
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
