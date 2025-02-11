import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/task.dart';
import 'package:todo/utils/app_colours.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.task.title;
    subtitleController.text = widget.task.subTitle;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// Navigator.pushNamed(context, '/details');
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: widget.task.isComplete
                ? AppColours.primaryColor.withOpacity(0.3)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))
            ]),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {},
            child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: .8),
                  shape: BoxShape.circle,
                  color: widget.task.isComplete
                      ? AppColours.primaryColor
                      : Colors.white),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 3),
            child: Text(
              titleController.text,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: widget.task.isComplete
                      ? AppColours.primaryColor
                      : Colors.black,
                  decoration: widget.task.isComplete
                      ? TextDecoration.lineThrough
                      : null),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitleController.text,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                    decoration: widget.task.isComplete
                        ? TextDecoration.lineThrough
                        : null),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('hh:mm a').format(widget.task.createdAtTime),
                        style: TextStyle(
                            fontSize: 14,
                            color: widget.task.isComplete
                                ? Colors.white
                                : Colors.grey),
                      ),
                      Text(
                          DateFormat.yMMMEd().format(widget.task.createdAtDate),
                          style: TextStyle(
                              fontSize: 12,
                              color: widget.task.isComplete
                                  ? Colors.white
                                  : Colors.grey)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
