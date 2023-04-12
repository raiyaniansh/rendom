import 'package:flutter/material.dart';
import 'package:rendom/screen/home/modal/home_modal.dart';
import 'package:rendom/utils/api_helper.dart';

class HomeProvider extends ChangeNotifier
{
  int i = 0;

  ApiHelper api =ApiHelper();

  HomeModal? homeModal;
  Future<HomeModal?> JsonParsing()
  async {
    homeModal = await api.RendomCall();
    notifyListeners();
  }
  void ChangeIndex(int index)
  {
    i= index;
    notifyListeners();
  }
}