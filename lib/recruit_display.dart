import 'package:flutter/material.dart';



class recruitDisplay extends StatelessWidget {
  const recruitDisplay({super.key});

    @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("募集"),
      ),
      body: Center(
        child: ListView(
          
        )
      ),
    );
  }
}
