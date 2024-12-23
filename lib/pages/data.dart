import 'package:http/http.dart' as http;
import 'dart:convert';//jsonデータをパースするときに使う

/*
//ユーザーの名前変数
String User_name_data = '太郎';
int grade = 2;
String User_info = 'よろしくお願いします。';
String User_rink = 'https:~~~';
*/


class ProfileDataFetcher {
  Future<Map<String, dynamic>> fetchData() async {
    final url = Uri.parse('http://localhost:4010/user/1');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final decodedResponce = json.decode(utf8.decode(response.bodyBytes)) as Map<String,dynamic>;
        print(decodedResponce);
        return decodedResponce; // データをMap形式で返す

      } else {
        print("失敗");
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
