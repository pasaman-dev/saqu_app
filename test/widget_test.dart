import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saqu_app/app/data/models/detail_surah.dart';
import 'package:saqu_app/app/data/models/surah.dart';

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah");
  var res = await http.get(url);

  var data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

  // Get data surah start from 0 - 113 (114 surah)
  // print(data[113]);

  // Transform data from api => Model
  Surah surahAnnas = Surah.fromJson(data[113]);

  // You can print using models function or instance
  // print(surahAnnas.name);
  // print(surahAnnas.number);
  // print(surahAnnas.numberOfVerses);
  // print(surahAnnas.revelation);
  // print(surahAnnas.sequence);
  // print(surahAnnas.toJson());

  // Print nested object / instance
  // print(surahAnnas.name?.long);

  Uri urlAnnas =
      Uri.parse("https://api.quran.gading.dev/surah/${surahAnnas.number}");
  var resAnnas = await http.get(urlAnnas);

  var dataAnnas = (jsonDecode(resAnnas.body) as Map<String, dynamic>)["data"];

  // print all rawa data
  // print(dataAnnas);

  DetailSurah annasDetail = DetailSurah.fromJson(dataAnnas);

  print(annasDetail.verses![0].text!.arab);
}
