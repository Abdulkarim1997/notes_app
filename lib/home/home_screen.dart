import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/shard/components/components.dart';

import '../shard/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController textFormFieldController = TextEditingController();
  List<Color> reminderColor = [GroceryColor, yellowLightColor];
  List<String> reminderTile = [
    "Todays grocery list",
    "June 26, 2022 08:05 PM",
  ];
  List<String> reminderDate = [
    "Todays grocery list",
    "June 22, 2022 05:00 PM",
  ];
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(33.0.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 95.h,
              ),
              Text(
                "Notepad",
                style: TextStyle(
                  fontSize: 37.5.sp,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 34.h,
                  bottom: 47.h,
                ),
                child: defaultFormField(
                    controller: textFormFieldController,
                    type: TextInputType.text,
                    validator: (value) {},
                    lable: null,
                    prefix: Icons.search),
              ),
              buildReminderList(),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 35.sp),
      ),
    );
  }

  Widget buildReminderList() => Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 58.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: reminderColor[index],
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reminderTile[index],
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      reminderDate[index],
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: reminderTile.length,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 15.h,
            );
          },
        ),
      );
}
