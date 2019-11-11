import 'dart:convert';

import 'package:bl_app_flutter/model/CommonModel.dart';
import 'package:bl_app_flutter/model/ConfigModel.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> navList;

  HomeModel({this.config, this.bannerList, this.navList});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var bannerListJson = json['bannerList'] as List;
    var navListJson = json['navList'] as List;
    final List<CommonModel> _bannerList = bannerListJson.map((i) => CommonModel.fromJson(i)).toList();
    final List<CommonModel> _navList = navListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel(
      config: ConfigModel.fromJson(json['config']),
      bannerList: _bannerList,
      navList: _navList,
    );
  }

  @override
  String toString(){
    return jsonEncode(this);
  }

//  // https://stackoverflow.com/questions/20024298/add-json-serializer-to-every-model-class#
//  Map<String, dynamic> toJson() => {
//    'config': config,
//    'bannerList': bannerList
//  };
}