import 'package:bl_app_flutter/model/CommonModel.dart';
import 'package:bl_app_flutter/widget/Webview.dart';
import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  final List<CommonModel> navList;

  const Nav({Key key, @required this.navList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (navList == null) return null;

    List<Widget> items = [];
    navList.forEach((model) {
      items.add(_item(context, model));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {
        if (model.url != '') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Webview(
                        url: model.url,
                        statusBarColor: model.statusBarColor,
                        hideAppBar: model.hideAppBar,
                        title: model.title,
                      )));
        }
      },
      child: Column(
        children: <Widget>[
          model.title == '精选'
              ? Text(
                  model.title,
                  style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
                )
              : Text(
                  model.title,
                  style: TextStyle(fontSize: 14),
                )
        ],
      ),
    );
  }
}
