import 'package:flutter/material.dart';
import 'package:latihan124210009/reports_list.dart';
import 'blogs_list.dart';
import 'news_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<dynamic> blogs = []; // Tambahkan data blogs sesuai respons dari sumber data/API

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainMenu(),
        '/newsList': (context) => NewsListPage(),
        '/blogList': (context) => BlogListPage(), // Sediakan data blogs ke BlogListPage
        '/reportList': (context) => ReportListPage(),
      },
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/newsList');
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'asset/image/news.png', // Ganti dengan path gambar yang sesuai
                    width: 100,
                    height: 100,
                  ),
                  Text('News'),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/blogList');
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'asset/image/blogs.png', // Ganti dengan path gambar yang sesuai
                    width: 100,
                    height: 100,
                  ),
                  Text('Blog'),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/reportList');
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'asset/image/reports.png', // Ganti dengan path gambar yang sesuai
                    width: 100,
                    height: 100,
                  ),
                  Text('Reports'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}