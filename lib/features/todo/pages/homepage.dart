import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/custom_text_field.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:task_management/common/widgets/width_spacer.dart';
import 'package:task_management/common/widgets/xpansion_tile.dart';
import 'package:task_management/features/todo/widgets/todo_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>with TickerProviderStateMixin {

 late TabController tabController = TabController(length: 2, vsync: this);
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(text: "Dashboard", style: appstyle(18, AppConst.kLight, FontWeight.bold),),
                  Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: AppConst.kLight,
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: GestureDetector(
                      onTap: (){},
                      child: Icon(Icons.add, color: AppConst.kBkDark,),
                    ),
                  )
                ],
              ),),
              const HeightSpacer(height: 20),
              CustomTextField(
                  keyboardType: TextInputType.text, hintText: "Search", controller: search,
              prefixIcon: Container(
                padding: EdgeInsets.all(14.h),
                child: GestureDetector(
                  onTap: null,
                  child: const Icon(AntDesign.search1, color: AppConst.kGreyLight,),
                ),
              ),
                suffixIcon: const Icon(FontAwesome.sliders, color: AppConst.kGreyLight,),
              ),
              const HeightSpacer(height: 15),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
         child: ListView(
           children: [
             const HeightSpacer(height: 25),
             Row(
               children: [
                 const Icon(FontAwesome.tasks, color: AppConst.kLight, size: 20,),
                 const WidthSpacer(width: 10),
                 ReusableText(text: "Today's Tasks", style: appstyle(18, AppConst.kLight, FontWeight.bold))
               ],
             ),
             const HeightSpacer(height: 25),

             Container(
               decoration: const BoxDecoration(
                 color: AppConst.kLight,
                 borderRadius: BorderRadius.all(Radius.circular(12))
               ),
               child: TabBar(
                   indicatorSize: TabBarIndicatorSize.label,
                   indicator: BoxDecoration(color: AppConst.kGreyLight,
                   borderRadius: BorderRadius.all(Radius.circular(12))),
                   controller: tabController,
                   labelPadding: EdgeInsets.zero,
                   isScrollable: false,
                   labelColor: AppConst.kBlueLight,
                   labelStyle: appstyle(24, AppConst.kBlueLight, FontWeight.w700),
                   unselectedLabelColor: AppConst.kLight,
                   tabs: [
                 Tab(
                   child: SizedBox(width: AppConst.kWidth*0.5,
                   child: Center(
                     child: ReusableText(text: "Pending", style: appstyle(16, AppConst.kBkDark, FontWeight.bold)),
                   ),),
                 ),
                 Tab(
                   child: Container(
                     padding: EdgeInsets.only(left: 30.w),
                     width: AppConst.kWidth*0.5,
                   child: Center(
                     child: ReusableText(text: "Completed Tasks", style: appstyle(16, AppConst.kBkDark, FontWeight.bold)),
                   ),),
                 )
               ]),
             ),
           const  HeightSpacer(height: 20),

             SizedBox(
               width: AppConst.kWidth,
               height: AppConst.kHeight*0.3,
               child: ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(12)),
                 child: TabBarView(
                   controller: tabController,
                     children: [
                       Container(
                         color: AppConst.kBkLight,
                         height: AppConst.kHeight*0.3,
                         child: ListView(
                           children:  [
                             TodoTile(
                               start: "03:00",
                               end: "06:00",
                               switcher: Switch(value: true,
                                   onChanged: (val){

                               }),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         color: AppConst.kBkLight,
                         height: AppConst.kHeight*0.3,
                       )
                     ]),
               ),
             ),
             const HeightSpacer(height: 20),
             
             const XpansionTile(text: 'Tomorrow\'s Tasks',
                 text2: "Tomorrow\'s tasks are shown here!",
                 children: []),

             const HeightSpacer(height: 20),

             XpansionTile(text: DateTime.now().add(const Duration(days: 2, )).toString().substring(5, 10),
                 text2: "Day after tomorrow tasks",
                 children: []),
           ],
         ), ),

      )
     );
  }
}
