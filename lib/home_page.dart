import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('PageMain')),
      body: Center(child:ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: Text('Go to Page2'),
        ),
      )
    );
  }
} 