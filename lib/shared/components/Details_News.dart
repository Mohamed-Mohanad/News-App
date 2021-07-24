import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/web_view.dart';
import 'package:news_app/shared/bloc/cubit.dart';
import 'package:news_app/shared/bloc/states.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:share/share.dart';

class DetailsScreen extends StatelessWidget {
  final String? image;
  final String title;
  final String? description;
  final String url;
  DetailsScreen(
      {required this.image,
      required this.title,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () async {
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  await Share.share('$url',
                      subject: 'Breaking News..!!',
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      image: DecorationImage(
                        image: pic(
                          image,
                          context,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    "$title",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      cubit.country == 'eg' ? 'تفاصيل' : "Details",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
                subtitle: Center(
                  child: description != null
                      ? Text(
                          "$description",
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      : Text(
                          cubit.country == 'eg'
                              ? 'لا يوجد تفاصيل يمكنك رؤية المصدر'
                              : "No Details..See The Source",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                ),
              ),
              Divider(),
              ListTile(
                title: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      cubit.country == 'eg' ? 'المصدر' : "Source",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
                subtitle: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      navigateTo(context, WebViewScreen(url));
                    },
                    child: Text(
                      cubit.country == 'eg' ? 'المصدر' : "Press Here",
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
