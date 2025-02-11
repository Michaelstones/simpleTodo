import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/extensions/space_ext.dart';
import 'package:todo/model/task.dart';
import 'package:todo/utils/app_colours.dart';
import 'package:todo/utils/app_str.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/view/home/component/home_app_bar.dart';
import 'package:todo/view/home/component/slider_drawer.dart';
import 'package:todo/view/home/component/task_widget.dart';
import 'package:todo/view/home/widget/Fab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<SliderDrawerState> drawerKey =
        GlobalKey<SliderDrawerState>();
    final List<int> dummy = [1];
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Fab(),
      body: SliderDrawer(
        key: drawerKey,
        isDraggable: false,
        animationDuration: 1000,
        slider: CustomDrawer(),
        appBar: HomeAppBar(
          drawerKey: drawerKey,
        ),
        child: _homebuildbody(textTheme, dummy),
      ),
    );
  }

  Widget _homebuildbody(TextTheme textTheme, List<int> dummy) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 60),
          height: 100,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                value: 1 / 3,
                backgroundColor: Colors.grey,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColours.primaryColor),
              ),
            ),
            25.w,
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppString.mainTitle, style: textTheme.displayLarge),
                  3.h,
                  Text('1 of 3 tasks', style: textTheme.titleMedium),
                ])
          ]),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 2,
              indent: 100,
            )),
        SizedBox(
            height: 745,
            width: double.infinity,
            child: dummy.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: dummy.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          direction: DismissDirection.horizontal,
                          onDismissed: (_) {
                            // remove from db
                          },
                          background: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: Colors.grey,
                                ),
                                8.w,
                                Text(
                                  AppString.deletedTask,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ]),
                          key: Key(index.toString()),
                          child: TaskWidget(
                            task: Task(
                              id: '1',
                              title: 'home',
                              subTitle: 'subTitle',
                              isComplete: true,
                              createdAtTime: DateTime.now(),
                              createdAtDate: DateTime.now(),
                            ),
                          ));
                    })
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Lottie.asset(lottieURL,
                                animate: dummy.isNotEmpty ? false : true)),
                      ),
                      FadeInUp(
                        from: 30,
                        child: Text(
                          AppString.doneAllTask,
                          // style: textTheme.displayLarge,
                        ),
                      )
                    ],
                  ))
      ]),
    );
  }
}
