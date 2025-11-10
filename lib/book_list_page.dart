import 'package:flutter/material.dart';
import 'book_read_page.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  final List<Map<String, String>> books = const [
    {
      'title': 'চাঁদের পাহাড়',
      'author': 'বিভূতিভূষণ বন্দ্যোপাধ্যায়',
      'file': 'chander_pahar.txt',
    },
    {
      'title': 'পথের পাঁচালী',
      'author': 'বিভূতিভূষণ বন্দ্যোপাধ্যায়',
      'file': 'pother_pachali.txt',
    },
    {
      'title': 'নকশী কাঁথার মাঠ',
      'author': 'জসীম উদ্দীন',
      'file': 'nokshi_kather_math.txt',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("গল্পের বই সমূহ"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4B79A1), Color(0xFF8E44AD)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.menu_book, color: Colors.deepPurple),
              title: Text(
                book['title']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                book['author']!,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookReadPage(
                      title: book['title']!,
                      fileName: book['file']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
