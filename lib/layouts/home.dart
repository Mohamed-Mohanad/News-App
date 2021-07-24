import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/search_screen.dart';
import 'package:news_app/shared/bloc/cubit.dart';
import 'package:news_app/shared/bloc/states.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/components/custom_drawer.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) { },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text(
              cubit.country == 'eg' ? 'الاخبار' : 'News',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    SearchScreen(),
                  );
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                  onPressed: () {
                    cubit.changeAppMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  )),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              switch (cubit.currentIndex) {
                case 0:
                  cubit.changeScreenDrawer(0);
                  break;
                case 1:
                  cubit.changeScreenDrawer(1);
                  break;
                case 2:
                  cubit.changeScreenDrawer(2);
                  break;
                case 3:
                  cubit.changeScreenDrawer(3);
                  break;
                case 4:
                  cubit.changeScreenDrawer(4);
                  break;
                case 5:
                  cubit.changeScreenDrawer(5);
                  break;
                case 6:
                  cubit.changeScreenDrawer(6);
                  break;
                default:
                  cubit.changeScreenDrawer(0);
              }
              Future.delayed(Duration(seconds: 1)).then(
                    (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.deepOrange,
                      content: Text(
                        cubit.country == 'eg'
                            ? "تم تحديث الاخبار بنجاح"
                            : "The News Has Been Updated Successfully",
                      ),
                    ),
                  );
                },
              );

              //successSnackBar(context: context,content:"The News Has Been Updated Successfully");
            },
            child: Icon(
              Icons.refresh,
            ),
          ),
        );
      },
    );
  }
}