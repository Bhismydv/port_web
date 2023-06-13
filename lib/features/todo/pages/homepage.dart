import 'package:flutter/material.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableText(text: "Todo With Me!", style: appstyle(26, Colors.cyan, FontWeight.bold)),
         const HeightSpacer(height: 50),
          ReusableText(text: "Todo With Me!", style: appstyle(26, Colors.cyan, FontWeight.bold)),
        ],
      ),
    );
  }
}
