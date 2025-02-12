import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';
import 'package:todo/extensions/space_ext.dart';
import 'package:todo/model/task.dart';
import 'package:todo/utils/app_colours.dart';
import 'package:todo/utils/app_str.dart';
import 'package:todo/view/tasks/component/date_selection_picker.dart';
import 'package:todo/view/tasks/component/rep_txt_field.dart';
import 'package:todo/view/tasks/widget/task_view_appbar.dart';

class TaskView extends StatefulWidget {
  const TaskView(
      {super.key,
      required this.task,
      required this.titleController,
      required this.descriptionController});

  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final Task? task;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  var title;
  var subtitle;
  DateTime? date;
  DateTime? time;

  String showTime(DateTime? time) {
    if (widget.task?.createdAtTime == null) {
      if (time == null) {
        return DateFormat('hh:mm a').format(DateTime.now()).toString();
      }
      return DateFormat('hh:mm a').format(time).toString();
    }
    return DateFormat('hh:mm a').format(widget.task!.createdAtTime).toString();
  }

  String showDate(DateTime? date) {
    if (widget.task != null && widget.task!.createdAtDate != null) {
      return DateFormat.yMMMEd().format(widget.task!.createdAtDate).toString();
    } else if (date != null) {
      return DateFormat.yMMMEd().format(date).toString();
    } else {
      return DateFormat.yMMMEd().format(DateTime.now()).toString();
    }
  }

  DateTime showDateAsDateTime(DateTime? date) {
    if (widget.task?.createdAtDate == null) {
      if (date == null) {
        return DateTime.now();
      }
      return date;
    }
    return widget.task!.createdAtDate;
  }

  bool isTaskExist() {
    if (widget.titleController?.text == null &&
        widget.descriptionController?.text == null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: TaskViewAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopSideText(textTheme),
              _buildMainAction(context),
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

  SizedBox _buildMainAction(BuildContext context) {
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
          RepTextField(
            controller: widget.titleController ?? TextEditingController(),
            isForDesc: false,
            onFieldSubmitted: (String inputTitle) {
              title = inputTitle;
            },
            onChanged: (String inputTitle) {
              title = inputTitle;
            },
          ),
          10.h,
          RepTextField(
            controller: widget.descriptionController ?? TextEditingController(),
            isForDesc: true,
            onFieldSubmitted: (String inputSubtitle) {
              subtitle = inputSubtitle;
            },
            onChanged: (String inputSubtitle) {
              subtitle = inputSubtitle;
            },
          ),
          DateTimeSelection(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) => SizedBox(
                        height: 280,
                        child: TimePickerWidget(
                          initDateTime: showDateAsDateTime(time),
                          onChange: (_, __) {},
                          dateFormat: 'HH:mm',
                          onConfirm: (dateTime, _) {
                            setState(() {
                              if (widget.task?.createdAtTime == null) {
                                time = dateTime;
                              }
                              widget.task!.createdAtTime = dateTime;
                            });
                          },
                        ),
                      ));
            },
            title: 'Time',
            time: showTime(time),
            isTime: true,
          ),
          DateTimeSelection(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                minDateTime: DateTime.now(),
                maxDateTime: DateTime(2030, 4, 5),
                initialDateTime: showDateAsDateTime(date),
                onConfirm: (dateTime, _) {
                  setState(() {
                    if (widget.task?.createdAtDate == null) {
                      time = dateTime;
                    }
                    widget.task!.createdAtDate = dateTime;
                  });
                },
              );
            },
            title: AppString.dateString,
            time: showDate(date),
          ),
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
                  text: isTaskExist()
                      ? AppString.addNewTask
                      : AppString.updateCurrentTask,
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
