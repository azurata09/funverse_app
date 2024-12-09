import 'package:flutter/material.dart';
import 'data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {
  String _userNameData = '読み込み中...';
  int _grade = 0;
  String _userInfo = '読み込み中...';
  String _userLink = '読み込み中...';


  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  //データをフェッチして変数に格納する関数
  Future<void> fetchProfileData() async {
    // ProfileDataFetcher fetcher = ProfileDataFetcher();

    try {
      final data = await fetchData();
      debugPrint('Fetched data: $data');

      setState(() {
        _userNameData = data['name'];
        _grade = data['grade'];
        _userInfo = data['bio'];
        // _userLink = data['sns'];
      });
    } catch (e) {
      setState(() {
        _userNameData = "エラー";
        _grade = 0;
        _userInfo = "エラー";
        // user_link = "エラー";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('名前: $_userNameData'),
            Text('学年: $_grade'),
            Text('自己紹介: $_userInfo'),
            // Text('$user_link'),
          ],
        ),
      ),
    );
  }
}