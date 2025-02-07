import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/extensions/space_ext.dart';
import 'package:todo/utils/app_colours.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final List<IconData> icon = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill
  ];

  final List<String> data = ['Home', 'Profile', 'Settings', 'Details'];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 90),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: AppColours.primaryGradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/024/183/525/non_2x/avatar-of-a-man-portrait-of-a-young-guy-illustration-of-male-character-in-modern-color-style-vector.jpg'),
          ),
          8.h,
          Text(
            'Michael David',
            // style: textTheme.displaySmall,
          ),
          Text(
            'Software Engineer',
            // style: textTheme.displaySmall,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            height: 300,
            child: ListView.builder(
              itemCount: icon.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    log('message');
                  },
                  child: Container(
                    margin: EdgeInsets.all(3),
                    child: ListTile(
                      leading: Icon(
                        icon[index],
                        color: Colors.white,
                      ),
                      title: Text(
                        data[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
