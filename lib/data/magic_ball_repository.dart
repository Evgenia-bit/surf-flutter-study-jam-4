import 'dart:convert';

import 'package:http/http.dart';


const host = 'https://eightballapi.com/api';

class MagicBallRepository {
  Future<String> getAnswer() async {
   final result = await get(Uri.parse(host));
   return jsonDecode(result.body)['reading'];
  }
}
