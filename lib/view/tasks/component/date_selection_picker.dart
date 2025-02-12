import 'package:flutter/material.dart';

class DateTimeSelection extends StatelessWidget {
  const DateTimeSelection({
    super.key,
    required this.onTap,
    required this.title,
    required this.time,
    this.isTime = false,
  });
  final VoidCallback onTap;
  final String title;
  final String time;
  final bool isTime;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: 55,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  title,
                  // style: textTheme.headlineMedium,
                ),
              ),
              Container(
                height: 35,
                width: isTime ? 80 : 150,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(time),
                ),
              ),
            ],
          )),
    );
  }
}
