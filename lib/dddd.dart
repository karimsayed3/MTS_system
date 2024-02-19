import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _onItemTapped(int index) {
    if(index == 0){
      _openDrawer();
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Bottom Nav Drawer Demo'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        children: const [
          Center(child: Text('Page 1')),
          Center(child: Text('Page 3')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Page 2',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Change to page 1
                _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Change to page 2
                _pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                Navigator.pop(context); // Close drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
