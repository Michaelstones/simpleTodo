import 'package:flutter/material.dart';
import 'package:todo/extensions/space_ext.dart';
import 'package:todo/utils/app_str.dart';
import 'package:todo/view/tasks/component/rep_txt_field.dart';
import 'package:todo/view/tasks/widget/task_view_appbar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: TaskViewAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopSideText(textTheme),
              SizedBox(
                width: double.infinity,
                height: 530,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        AppString.titleOfTitleTextField,
                        // style: textTheme.headlineMedium,
                      ),
                    ),
                    RepTextField(controller: titleController),
                    10.h,
                    RepTextField(
                      controller: descriptionController,
                      isForDesc: true,
                    ),
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSideText(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          ),
          RichText(
              text: TextSpan(
                  text: AppString.addNewTask,
                  style: textTheme.titleLarge,
                  children: [
                TextSpan(
                    text: AppString.taskStrnig,
                    style: TextStyle(fontWeight: FontWeight.w500))
              ])),
          SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          )
        ],
      ),
    );
  }
}
