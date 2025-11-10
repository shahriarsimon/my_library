import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookReadPage extends StatefulWidget {
  final String title;
  final String fileName;

  const BookReadPage({
    super.key,
    required this.title,
    required this.fileName,
  });

  @override
  State<BookReadPage> createState() => _BookReadPageState();
}

class _BookReadPageState extends State<BookReadPage> {
  String _bookContent = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadBook();
  }

  Future<void> _loadBook() async {
    try {
      final text = await rootBundle.loadString('assets/${widget.fileName}');
      setState(() {
        _bookContent = text;
      });
    } catch (e) {
      setState(() {
        _bookContent = 'Error loading book: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8E44AD), Color(0xFF283E51)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(
          _bookContent,
          style: const TextStyle(fontSize: 18, height: 1.6),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
