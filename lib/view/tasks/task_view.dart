import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:todo/extensions/space_ext.dart';
import 'package:todo/utils/app_colours.dart';
import 'package:todo/utils/app_str.dart';
import 'package:todo/view/tasks/component/date_selection_picker.dart';
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
              _buildMainAction(titleController, descriptionController, context),
              _buildButton()
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            minWidth: 150,
            height: 55,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.white,
            onPressed: () {},
            child: Row(children: [
              Icon(Icons.close, color: AppColours.primaryColor),
              5.w,
              Text(
                AppString.deleteTask,
                style: TextStyle(color: AppColours.primaryColor),
              ),
            ]),
          ),
          //
          MaterialButton(
            minWidth: 150,
            height: 55,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: AppColours.primaryColor,
            onPressed: () {},
            child: Text(
              AppString.addTaskString,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildMainAction(TextEditingController titleController,
      TextEditingController descriptionController, BuildContext context) {
    return SizedBox(
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
          DateTimeSelection(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) => SizedBox(
                          height: 280,
                          child: TimePickerWidget(
                            onChange: (_, __) {},
                            dateFormat: 'HH:mm',
                            onConfirm: (dateTime, _) {},
                          ),
                        ));
              },
              title: AppString.timeString),
          DateTimeSelection(
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  minDateTime: DateTime.now(),
                  maxDateTime: DateTime(2030, 4, 5),
                  onConfirm: (dateTime, _) {},
                );
              },
              title: AppString.dateString),
        ],
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
