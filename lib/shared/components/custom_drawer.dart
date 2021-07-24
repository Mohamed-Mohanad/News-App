import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/api_country.dart';
import 'package:news_app/shared/bloc/cubit.dart';
import 'package:news_app/shared/bloc/states.dart';
import 'package:news_app/shared/components/components.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        Country? dropdownValue;
        return Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  cubit.changeScreenDrawer(0);
                  Navigator.of(context).pop();
                },
                title: Text(
                  cubit.country == 'eg' ? 'عام' : 'General',
                  style: Theme.of(context).textTheme.headline1,
                ),
                leading: Icon(
                  Icons.home,
                ),
              ),
              ListTile(
                onTap: () {
                  cubit.changeScreenDrawer(1);
                  Navigator.of(context).pop();
                },
                title: Text(
                  cubit.country == 'eg' ? 'رياضة' : 'Sports',
                  style: Theme.of(context).textTheme.headline1,
                ),
                leading: Icon(
                  Icons.sports,
                ),
              ),
              ListTile(
                onTap: () {
                  cubit.changeScreenDrawer(2);
                  Navigator.of(context).pop();
                },
                title: Text(
                  cubit.country == 'eg' ? 'ريادة اعمال' : 'Business',
                  style: Theme.of(context).textTheme.headline1,
                ),
                leading: Icon(
                  Icons.monetization_on,
                ),
              ),
              ListTile(
                onTap: () {
                  cubit.changeScreenDrawer(3);
                  Navigator.of(context).pop();
                },
                title: Text(
                  cubit.country == 'eg' ? 'صحة' : 'Health',
                  style: Theme.of(context).textTheme.headline1,
                ),
                leading: Icon(
                  Icons.favorite,
                ),
              ),
              ListTile(
                onTap: () {
                  cubit.changeScreenDrawer(4);
                  Navigator.of(context).pop();
                },
                title: Text(
                  cubit.country == 'eg' ? 'علوم' : 'Science',
                  style: Theme.of(context).textTheme.headline1,
                ),
                leading: Icon(
                  Icons.science,
                ),
              ),
              ListTile(
                onTap: () {
                  cubit.changeScreenDrawer(5);
                  Navigator.of(context).pop();
                },
                title: Text(
                  cubit.country == 'eg' ? 'تكنولوجيا' : 'Technology',
                  style: Theme.of(context).textTheme.headline1,
                ),
                leading: Icon(
                  Icons.phone_android,
                ),
              ),
              ListTile(
                onTap: () {
                  cubit.changeScreenDrawer(6);
                  Navigator.of(context).pop();
                },
                title: Text(
                  cubit.country == 'eg' ? 'ترفيه' : 'Entertainment',
                  style: Theme.of(context).textTheme.headline1,
                ),
                leading: Icon(
                  Icons.sports_handball,
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    cubit.country == 'eg' ? 'دولة' : "Country:",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  DropdownButton<Country>(
                    hint: Text('Select a Country'),
                    underline: Container(
                      height: 2,
                      color: Colors.deepOrange,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    value: dropdownValue,
                    onChanged: (Country? value) {
                      setState(() {
                        dropdownValue = value!;
                        cubit.country = value.country;
                      });
                      showMyDialog(
                        context: context,
                        title: Text(
                          cubit.country != 'eg' ? 'انتبه من فضلك' : "Attention",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        message: Text(
                          cubit.country != 'eg'
                              ? 'من فضلك اضغط علي زر التحديث حتي يتم تحميل اخبار الدولة التي تم اختياراها'
                              : "Please, press refresh button to get the news of the new selected country",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      );
                    },
                    items: countries.map((Country user) {
                      return DropdownMenuItem<Country>(
                        value: user,
                        child: Row(
                          children: <Widget>[
                            Text(
                              user.country,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                ],
              ),
              SizedBox(
                height: 300.0,
              ),
              Center(
                child: Text(
                  cubit.country == 'eg'
                      ? "2021 Mohamed Mohanad All rights reserved ©"
                      : "© 2021 Mohamed Mohanad All rights reserved",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

