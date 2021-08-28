import 'package:flutter/material.dart';

class BoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('BoxPage')),
      body: Center(child:ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: Text('Go to Page2'),
        ),
      )
    );
  }
} 