import 'package:flutter/material.dart';
import 'pages/data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {

  String User_name_data = '読み込み中...';
  int grade = 0;
  String User_info = '読み込み中...';
  String User_link = '読み込み中...';

  @override
  void initState() {
    super.initState();
    ProfileDataFetcher();
    fetchProfileData();
  }

  //データをフェッチして変数に格納する関数
  void fetchProfileData() async {
    ProfileDataFetcher fetcher = ProfileDataFetcher();
    try {
      final data = await fetcher.fetchData();
      debugPrint('Fetched data: $data');
      setState(() {
        User_name_data = data['name'];
        grade = data['grade'];
        User_info = data['bio'];
        User_link = data['sns']['x'];
      });
    } catch (e) {
      setState(() {
        User_name_data = "エラー";
        grade = 0;
        User_info = "エラー";
        User_link = "エラー";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    // initState();
    // fetchProfileData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 背景のグラデーションヘッダー部分
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.teal],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // プロフィール画像と情報
          Transform.translate(
            offset: const Offset(0, -50), // プロフィール画像を上に重ねる
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // サンプル画像URL
                ),
                const SizedBox(height: 10),
                Text(
                  User_name_data,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$grade',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  User_info,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  User_link,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 20),
                // ステータス情報
              ],
            ),
          ),
        ],
      ),
    );
   }
}
// ステータスインジケーターウィジェット
class StatusIndicator extends StatelessWidget {
  final Color color;
  final String text;

  const StatusIndicator({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: color,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

