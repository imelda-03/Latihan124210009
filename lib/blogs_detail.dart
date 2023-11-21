import 'package:flutter/material.dart';

class BlogDetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String summary;

  // Constructor untuk menerima data dari blog yang dipilih
  BlogDetailPage({
    required this.title,
    required this.imageUrl,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              imageUrl,
              height: 200, // Sesuaikan dengan tinggi gambar yang diinginkan
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              summary,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}