import 'package:flutter/material.dart';
import 'package:news_app/shared/bloc/cubit.dart';
import 'package:news_app/shared/components/Details_News.dart';


Widget buildArticleItem(article, context) {
  return InkWell(
    onTap: () {
      navigateTo(
          context,
          DetailsScreen(
            image: article['urlToImage'],
            title: article['title'],
            description: article['description'],
            url: article['url'],
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              image: DecorationImage(
                image: pic(
                  article['urlToImage'],
                  context
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.headline1,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget articleBuilder(list, context, {bool isSearch = false}) {
  return list.length > 0
      ? ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          itemCount: list.length,
        )
      : isSearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            );
}

Widget defaultFormField({
  bool isPassword = false,
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) {
  return TextFormField(
    enabled: isClickable,
    obscureText: isPassword,
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: (s){
      onSubmit!(s);
    },
    onChanged: (s){
      onChange!(s);
    },
    onTap: (){
      onTap!();
    },
    validator: (ss){
      validate(ss);
    },
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        prefix,
      ),
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: (){
                suffixPressed!();
              },
              icon: Icon(
                suffix,
              ),
            )
          : null,
      border: OutlineInputBorder(),
    ),
  );
}

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

Future<void> showMyDialog({
  required Text title,
  required Text message,
  required BuildContext context,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              message,
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.deepOrange),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

ImageProvider pic(String? image, context) {
  if (image != null) {
    return NetworkImage(
      '$image',
    );
  } else {
    return AssetImage(
      NewsCubit.get(context).country == 'eg' ? 'assets/images/breaking _news.jpg' : 'assets/images/breaking_news_2.jpg',
    );
  }
}
