import 'dart:developer';

import 'package:rxdart/rxdart.dart';

import '../Database/api_caller.dart';
import '../Model/user_data_model.dart';

class GlobalBlock {
  BehaviorSubject<UserVoterDataModel> get getUserData => _liveUserData;

  final BehaviorSubject<UserVoterDataModel> _liveUserData =
      BehaviorSubject<UserVoterDataModel>();

  Future<UserVoterDataModel> doFetchUserData({
    int? id,
    String? jsonrpc,
    String? method,
  }) async {
    Map bodyData = {
      "id": id,
      "jsonrpc": jsonrpc,
      "method": method,
      "params": {"sort": "trending", "tag": "", "observer": "hive.blog"}
    };

    try {
      Map<String, dynamic> res = await ApiCaller.post(bodyData);
      var data = UserVoterDataModel.fromJson(res);
      _liveUserData.add(data);
      return data;
    } catch (e) {
      log("Getting Error in doFetchUserData : $e");
      throw "Something Went Wrong : $e";
    }
  }
}

GlobalBlock globalBlock = GlobalBlock();
