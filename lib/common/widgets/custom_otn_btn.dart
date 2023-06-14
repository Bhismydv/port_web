import 'package:flutter/material.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/reusable_text.dart';

class CustomOtnBtn extends StatelessWidget {
  const CustomOtnBtn({Key? key, this.onTap, required this.width, required this.height, this.color2, required this.color, required this.text}) : super(key: key);
  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color2;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color2,
            borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1)),
        child: Center(
          child: ReusableText(text: text, style: appstyle(18, color, FontWeight.bold)),
        ),
      ),
    );
  }
}
