import 'package:bl_app_flutter/dao/HomeDao.dart';
import 'package:bl_app_flutter/model/CommonModel.dart';
import 'package:bl_app_flutter/model/HomeModel.dart';
import 'package:bl_app_flutter/widget/Loading.dart';
import 'package:bl_app_flutter/widget/Nav.dart';
import 'package:bl_app_flutter/widget/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _appBarAlpha = 0;
  List _banners = [
    Image.asset('images/city-4800x500.jpg', fit: BoxFit.fill),
    Image.asset('images/highway-4800x500.jpg', fit: BoxFit.fill),
    Image.asset('images/tower-4800x500.jpg', fit: BoxFit.fill),
    Image.asset('images/vegetation-4800x500.jpg', fit: BoxFit.fill),
  ];
  HomeModel homeModel;
  List<CommonModel> navList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: Loading(
            isLoading: _isLoading,
            child: Stack(
              children: <Widget>[
                MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: RefreshIndicator(
                        child: NotificationListener(
                          onNotification: (scrollNotification) {
                            if (scrollNotification
                                    is ScrollUpdateNotification &&
                                scrollNotification.depth == 0) {
                              // 列表滚动
                              _onScroll(scrollNotification.metrics.pixels);
                              return true;
                            } else {
                              return false;
                            }
                          },
                          child: ListView(
                            children: <Widget>[
                              Container(
                                height: 160,
                                child: Swiper(
                                  itemCount: _banners.length,
                                  autoplay: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _banners[index];
                                  },
                                  pagination: SwiperPagination(),
                                ),
                              ),
//                      Padding(
//                        padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
//                        child: Nav(
//                          navList: navList,
//                        ),
//                      ),
                              Nav(
                                navList: navList,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                child: Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(right: 8),
                                          child: Icon(
                                            Icons.notifications_active,
                                            color: Colors.grey,
                                            size: 14,
                                          ),
                                        ),
                                        Text(
                                          '红包已入账，请注意查收',
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                child: Container(
//                          decoration: BoxDecoration(
//                              color: Colors.white,
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(6))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '精品推荐',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.deepOrange),
                                          ),
                                          Text('更多>>',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.deepOrange))
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 150,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: _genWidgets(
                                              5,
                                              Container(
                                                height: 88,
                                                width: 120,
                                                child: Card(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Stack(
                                                        children: <Widget>[
                                                          Image.asset(
                                                              'images/recommend-1039-120x80.jpg'),
//                                              Align(
//                                                alignment: Alignment.bottomLeft,
//                                                child: Text('三维角色动画设计', style: TextStyle(color: Colors.white),),
//                                              ),
                                                          Positioned(
                                                            left: 0,
                                                            bottom: 0,
                                                            child: Text(
                                                              '三维角色动画设计',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: Text(
                                                            '介绍了建模、拓补、绑定、动画整个流程',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          )),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(
                                                              'Lv3',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 4,
                                                                      right: 4),
                                                              child: Text(''),
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons
                                                                      .account_circle,
                                                                  size: 10,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
//                                                      Padding(padding: EdgeInsets.only(left: 1, right: 1), child: Text(''),),
                                                                Text(
                                                                  '147',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .grey),
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 4,
                                                                      right: 4),
                                                              child: Text(''),
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons.timer,
                                                                  size: 10,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
//                                                      Padding(padding: EdgeInsets.only(left: 1, right: 1), child: Text(''),),
                                                                Text(
                                                                  '27',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .grey),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 8, 4, 0),
                                child: Container(
//                          decoration: BoxDecoration(
//                              color: Colors.white,
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(6))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '热门专区',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.deepOrange),
                                          ),
                                          Text('更多>>',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.deepOrange))
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 150,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: _genWidgets(
                                            5,
                                            Container(
                                              height: 88,
                                              width: 120,
                                              child: Card(
                                                child: Column(
                                                  children: <Widget>[
                                                    Stack(
                                                      children: <Widget>[
                                                        Image.asset(
                                                            'images/hot-557-120x80.jpg'),
//                                              Align(
//                                                alignment: Alignment.bottomLeft,
//                                                child: Text('三维角色动画设计', style: TextStyle(color: Colors.white),),
//                                              ),
                                                        Positioned(
                                                          left: 0,
                                                          bottom: 0,
                                                          child: Text(
                                                            '原创作品《程序猿的自我修痒》',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Text(
                                                          '介绍了建模、拓补、绑定、动画整个流程',
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        )),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Text(
                                                            'Lv3',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 4,
                                                                    right: 4),
                                                            child: Text(''),
                                                          ),
                                                          Row(
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons
                                                                    .account_circle,
                                                                size: 10,
                                                                color:
                                                                    Colors.grey,
                                                              ),
//                                                      Padding(padding: EdgeInsets.only(left: 1, right: 1), child: Text(''),),
                                                              Text(
                                                                '147',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .grey),
                                                              )
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 4,
                                                                    right: 4),
                                                            child: Text(''),
                                                          ),
                                                          Row(
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons.timer,
                                                                size: 10,
                                                                color:
                                                                    Colors.grey,
                                                              ),
//                                                      Padding(padding: EdgeInsets.only(left: 1, right: 1), child: Text(''),),
                                                              Text(
                                                                '27',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .grey),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 8, 4, 0),
                                child: Container(
//                          decoration: BoxDecoration(
//                              color: Colors.white,
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(6))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '行业方向',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.deepOrange),
                                          ),
                                          Text('更多>>',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.deepOrange))
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 150,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: _genWidgets(
                                              5,
                                              Container(
                                                height: 88,
                                                width: 120,
                                                child: Card(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Stack(
                                                        children: <Widget>[
                                                          Image.asset(
                                                              'images/industry-399-120x80.jpg'),
//                                              Align(
//                                                alignment: Alignment.bottomLeft,
//                                                child: Text('三维角色动画设计', style: TextStyle(color: Colors.white),),
//                                              ),
                                                          Positioned(
                                                            left: 0,
                                                            bottom: 0,
                                                            child: Text(
                                                              '原创作品《程序猿的自我修痒》',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: Text(
                                                            '介绍了建模、拓补、绑定、动画整个流程',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          )),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(
                                                              'Lv3',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 4,
                                                                      right: 4),
                                                              child: Text(''),
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons
                                                                      .account_circle,
                                                                  size: 10,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
//                                                      Padding(padding: EdgeInsets.only(left: 1, right: 1), child: Text(''),),
                                                                Text(
                                                                  '147',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .grey),
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 4,
                                                                      right: 4),
                                                              child: Text(''),
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons.timer,
                                                                  size: 10,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
//                                                      Padding(padding: EdgeInsets.only(left: 1, right: 1), child: Text(''),),
                                                                Text(
                                                                  '27',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .grey),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              )

//                      Container(
//                        height: 800,
//                        child: ListTile(
//                          title: Text(homeModel?.config?.searchUrl ?? ''),
//                        ),
//                      )
                            ],
                          ),
                        ),
                        onRefresh: loadData)),
                _appBar
              ],
            )));
  }

//  loadData() {
//    HomeDao.fetch().then((result) {
//      setState(() {
//        homeModelString = json.encode(result);
//      });
//    }).catchError((e) {
//      setState(() {
//        homeModelString = e.toString();
//      });
//    });
//  }

  Future<Null> loadData() async {
    try {
      HomeModel _homeModel = await HomeDao.fetch();
      setState(() {
        homeModel = _homeModel;
        navList = homeModel.navList;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }

    return null;
  }

  void _onScroll(double pixels) {
    double alpha = pixels / APPBAR_SCROLL_OFFSET;

    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      _appBarAlpha = alpha;
    });
  }

  List<Widget> _genWidgets(int size, Widget widget) {
    final List<Widget> _items = [];

    for (var i = 0; i < size; i++) {
      _items.add(widget);
    }

    return _items;
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0x66000000), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80,
            decoration: BoxDecoration(
                color: Color.fromARGB(
                    (_appBarAlpha * 255).toInt(), 33, 150, 243)),
            child: SearchBar(
              searchBarType: _appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: () {},
              defaultText: '请输入要搜索的内容',
              leftBtnClick: () {},
            ),
          ),
        ),
        // 底部阴影
        Container(
          height: _appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]
          ),
        )
      ],
    );

//    return SearchBar(
//      searchBarType:
//          _appBarAlpha > 0.2 ? SearchBarType.homeLight : SearchBarType.home,
//      inputBoxClick: () {},
//      defaultText: '请输入要搜索的内容',
//      leftBtnClick: () {},
//    );

//    return Opacity(
//      opacity: _appBarAlpha,
//      child: Container(
//        height: 80,
//        decoration:
//        BoxDecoration(color: Color(int.parse('0xff2196F3'))),
//        child: Center(
//          child: Padding(
//            padding: EdgeInsets.only(top: 20),
//            child: Text(
//              '首页',
//              style: TextStyle(color: Colors.white),
//            ),
//          ),
//        ),
//      ),
//    );
  }
}
