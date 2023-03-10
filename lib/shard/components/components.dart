import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 40,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required void Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function,
        child: Text(isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
Widget defaultTextButton({
  required void Function()? function,
  required String text,
}) =>
    TextButton(onPressed: function, child: Text(text.toUpperCase()));
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validator,
  required String? lable,
  required IconData? prefix,
  void Function(String)? onSubmitted,
  void Function(String)? onChanged,
  bool isPassword = false,
  IconData? suffix,
  void Function()? suffixPressed,
  bool isClickable = true,
  void Function()? onTap,
}) =>
    SizedBox(
      height: 27.h,
      child: TextFormField(
        enabled: isClickable,
        validator: validator,
        controller: controller,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        keyboardType: type,
        onTap: onTap,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: "Search notes",
          labelText: lable,
          prefixIcon: Icon(
            prefix,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyColor),
            borderRadius: BorderRadius.circular(25.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(color: defaultColor),
          ),
          contentPadding: EdgeInsetsDirectional.only(top: 7.h),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          // border: const OutlineInputBorder(),
        ),
      ),
    );
Widget buildTaskItem(Map modle, context) => Dismissible(
      key: Key(modle['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${modle['time']}',
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${modle['title']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${modle['date']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.archive,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (diection) {},
    );

Widget tasksBuilder(
  @required List<Map> tasks,
) =>
    ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (BuildContext context, int index) =>
            buildTaskItem(tasks[index], context),
        separatorBuilder: (BuildContext context, int index) => myDivider(),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Tasks yet, please Add Some Tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

Widget buildListProduct(
  model,
  BuildContext context, {
  bool isOldPrice = true,
}) {
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Container(
      height: 120,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                width: 120,
                height: 120,
                image: NetworkImage(model.image ?? "put Hold image"),

                // fit: BoxFit.cover,
              ),
              if (model.discount != 0 && isOldPrice)
                Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    )),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      model.price.toString(),
                      style: TextStyle(fontSize: 12, color: defaultColor),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    if (model.discount != 0 && isOldPrice)
                      Text(
                        model.oldPrice.toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor: defaultColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined),
                        iconSize: 14.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color? chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERROR:
      color = Colors.red;
      break;

    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
