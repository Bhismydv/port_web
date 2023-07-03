import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:task_management/common/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({Key? key, this.color, this.title, this.description, this.start, this.end, this.editWidget, this.delete, this.switcher}) : super(key: key);

  final String? title, description, start, end;
  final Color? color;
  final Widget? editWidget;
  final void Function()? delete;
  final Widget? switcher;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: 8.h),
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8.h),
          width: AppConst.kWidth,
          decoration: const BoxDecoration(
            color: AppConst.kGreyLight,
            borderRadius: BorderRadius.all(Radius.circular(12),),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(const Radius.circular(12)),
                      //Todo: Add Dynamic Color
                      color: color ?? AppConst.kRed,
                    ),
                  ),
                  const WidthSpacer(width: 15),

                  Padding(padding: EdgeInsets.all(8.h),
                  child: SizedBox(
                    width: AppConst.kWidth*0.6,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(text: title ?? "title of todo", style: appstyle(18, AppConst.kLight, FontWeight.bold)),
                      const HeightSpacer(height: 3),
                        ReusableText(text: description ?? "description of todo", style: appstyle(12, AppConst.kLight, FontWeight.bold)),
                        const HeightSpacer(height: 10),

                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: AppConst.kWidth*0.3,
                              height: 25.h,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.3,
                                color: AppConst.kGreyDk,),
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                color: AppConst.kBkDark,
                              ),
                              child: Center(
                                child: ReusableText(text: "$start | $end", style: appstyle(12, AppConst.kLight, FontWeight.normal)),
                              ),
                            ),
                           const WidthSpacer(width: 20),
                            Row(
                              children: [
                                SizedBox(
                                  child: editWidget,
                                ),
                                const WidthSpacer(width: 20),
                                GestureDetector(
                                  onTap: delete,
                                  child: Icon(MaterialCommunityIcons.delete_circle),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),)
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: 0.h),
                child: switcher,
              )
            ],
          ),
        )
      ],
    ),);
  }
}
