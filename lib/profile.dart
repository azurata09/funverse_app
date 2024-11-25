import 'package:flutter/material.dart';
import 'data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {
  int _counter = 0;

  String User_name_data = '読み込み中...';
  int grade = 0;
  String User_info = '読み込み中...';
  String User_link = '読み込み中...';

  @override
  void initState() {
    super.initState();
    // ProfileDataFetcher();
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
        // user_link = data['sns'];
      });
    } catch (e) {
      setState(() {
        User_name_data = "エラー";
        grade = 0;
        User_info = "エラー";
        // user_link = "エラー";
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    // initState();
    // fetchProfileData();
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('名前: $User_name_data'),
            Text('学年: $grade'),
            Text('自己紹介: $User_info'),
            // Text('$user_link'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}