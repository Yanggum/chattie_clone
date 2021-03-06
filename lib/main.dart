import 'package:flutter/material.dart';
import 'home_page.dart';
import 'original_page.dart';
import 'search_page.dart';
import 'box_page.dart';
import 'my_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chattie Clone',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Chattie Clone'),
    );
  }
}

var pageController;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _tabIndex = 0;
  int _page = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }    

  void onPageChanged(int page){
    setState(() {
      this._page = page;
    });
  }  

  @override
  Widget build(BuildContext context) {
    void tabIndexTaped(index) {
      setState(() {
        _tabIndex = index;
      }); 

      pageController.jumpToPage(index);

    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: new Icon(Icons.message),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.alarm),
            onPressed: () => {})
        ]
      ),
      body: PageView(
        children: [
          Container(
            color: Colors.white,
            child: HomePage(),
          ),
          Container(
            color: Colors.white,
            child: OriginalPage(),
          ),
          Container(
            color: Colors.white,
            child: SearchPage(),
          ),
          Container(
            color: Colors.white,
            child: BoxPage(),
          ),
          Container(
            color: Colors.white,
            child: MyPage(),
          ),
        ],
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: tabIndexTaped,
        showUnselectedLabels: true,
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "???"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "????????????"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "??????"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "?????????"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box ), label: "???????????????"),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
