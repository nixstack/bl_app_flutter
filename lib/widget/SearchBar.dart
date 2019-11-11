import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final bool enabled; // 是否禁止搜索
  final bool hideLeft; // 是否隐藏左边按扭
  final SearchBarType searchBarType; // SearchBar的类型
  final String hint; // 提示文字
  final String defaultText;
  final void Function() leftBtnClick;
  final void Function() rightBtnClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  const SearchBar(
      {Key key,
      this.enabled,
      this.hideLeft,
      this.searchBarType,
      this.hint,
      this.defaultText,
      this.leftBtnClick,
      this.rightBtnClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isShowClear = false;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    if (widget.defaultText != null) {
      setState(() {
        textEditingController.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.searchBarType == SearchBarType.normal ? null : _homeSearch();
  }

  _homeSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapTap(
              Container(
                  padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
                  child: Row(
                    children: <Widget>[
                      Text('上海', style: TextStyle(color: Colors.white),),
                      Icon(
                        Icons.expand_more,
                        color: Colors.white,
                      )
                    ],
                  )),
              widget.leftBtnClick),
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Icon(
                  Icons.comment,
                  size: 26,
                  color: Colors.white,
                ),
              ),
              widget.rightBtnClick)
        ])
    );
  }

  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  _inputBox() {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse('0xffEDEDED'));
    }
    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: inputBoxColor,
          borderRadius: BorderRadius.circular(
              widget.searchBarType == SearchBarType.normal ? 5 : 15)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffA9A9A9)
                : Colors.blue,
          ),
          Expanded(
              flex: 1,
              child: widget.searchBarType == SearchBarType.normal
                  ? TextField(
                  controller: textEditingController,
                  onChanged: _onChanged,
                  autofocus: true,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                  //输入文本的样式
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    border: InputBorder.none,
                    hintText: widget.hint ?? '',
                    hintStyle: TextStyle(fontSize: 15),
                  ))
                  : _wrapTap(
                  Container(
                    child: Text(
                      widget.defaultText,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                  widget.inputBoxClick)),
          !isShowClear
              ? _wrapTap(
              Icon(
                Icons.mic,
                size: 22,
                color: widget.searchBarType == SearchBarType.normal
                    ? Colors.blue
                    : Colors.grey,
              ),
              () {})
              : _wrapTap(
              Icon(
                Icons.clear,
                size: 22,
                color: Colors.grey,
              ), () {
            setState(() {
              textEditingController.clear();
            });
            _onChanged('');
          })
        ],
      ),
    );
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        isShowClear = true;
      });
    } else {
      setState(() {
        isShowClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }
}
