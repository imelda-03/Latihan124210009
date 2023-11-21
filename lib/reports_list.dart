import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latihan124210009/reports_detail.dart';
import 'package:latihan124210009/reports_detail.dart';

class ReportListPage extends StatefulWidget {
  @override
  _ReportListPageState createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  late List<dynamic> _reportList = [];

  @override
  void initState() {
    super.initState();
    fetchReports();
  }

  Future<void> fetchReports() async {
    try {
      final response = await http.get(Uri.parse('https://api.spaceflightnewsapi.net/v4/reports/?format=json'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          _reportList = jsonResponse; // Mengambil daftar laporan dari respons API
        });
      } else {
        throw Exception('Failed to load reports');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spaceflight Reports'),
      ),
      body: _reportList.isNotEmpty
          ? ListView.builder(
        itemCount: _reportList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: _reportList[index]['imageUrl'] != null
                ? Image.network(
              _reportList[index]['imageUrl'],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            )
                : SizedBox.shrink(),
            title: Text(_reportList[index]['title']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReportDetailPage(report: _reportList[index]),
                ),
              );
            },
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
