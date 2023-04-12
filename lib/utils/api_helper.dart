import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rendom/screen/home/modal/home_modal.dart';
class ApiHelper
{
  HomeModal? homeModal;
  Future<HomeModal?> RendomCall()
  async {
    Uri uri =Uri.parse('https://randomuser.me/api/');
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    homeModal = HomeModal.fromJson(json);
    return homeModal;
  }
}