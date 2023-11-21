import 'package:flutter/material.dart';

class ReportDetailPage extends StatelessWidget {
  final Map<String, dynamic> report;

  ReportDetailPage({required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              report['image_url'],
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              report['title'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              report['summary'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}