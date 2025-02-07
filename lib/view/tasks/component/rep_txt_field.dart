import 'package:flutter/material.dart';
import 'package:todo/utils/app_str.dart';

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.controller,
    this.isForDesc = false,
  });

  final TextEditingController controller;
  final bool isForDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDesc ? 6 : null,
          cursorHeight: !isForDesc ? 60 : null,
          onFieldSubmitted: (value) {},
          onChanged: (value) {},
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              hintText: isForDesc ? AppString.addNote : null,
              counter: Container(),
              border: isForDesc ? InputBorder.none : null,
              prefixIcon: isForDesc
                  ? Icon(
                      Icons.bookmark_border,
                      color: Colors.grey,
                    )
                  : null,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300))),
        ),
      ),
    );
  }
}
