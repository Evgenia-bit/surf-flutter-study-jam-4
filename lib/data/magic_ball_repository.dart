import 'dart:convert';
import 'package:http/http.dart';


const url = 'https://eightballapi.com/api';

//репозиторий для получения ответов
class MagicBallRepository {
  Future<String> getAnswer() async {
   final result = await get(Uri.parse(url));
   return jsonDecode(result.body)['reading'];
  }
}
