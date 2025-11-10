import 'package:flutter/material.dart';
import 'book_list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4B79A1), Color(0xFF283E51)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Drawer Header
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                accountName: Text(
                  "শাহরিয়ার খান সাইমন",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("shahriarkhan155@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.deepPurple, size: 30),
                ),
              ),

              // Drawer Options
              buildDrawerItem(Icons.home, "হোম", context),
              buildDrawerItem(Icons.menu_book, "সব গল্প", context, page: BookListPage()),
              buildDrawerItem(Icons.favorite, "পছন্দের বই", context),
              buildDrawerItem(Icons.star, "জনপ্রিয় বই", context),
              buildDrawerItem(Icons.info, "আমাদের সম্পর্কে", context),
              Divider(color: Colors.white70, thickness: 1),
              buildDrawerItem(Icons.logout, "লগআউট", context),
            ],
          ),
        ),
      ),

      body: Container(
        // 🌄 Background image from network
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=1400&q=80',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.15),
              BlendMode.darken,
            ),
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              // 🔹 Custom AppBar Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(Icons.menu, color: Colors.white, size: 28),
                      ),
                    ),
                    Text(
                      "📚 বাংলা গল্পের বই",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black45,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 🔹 Welcome text
              Text(
                "স্বাগতম, শাহরিয়ার  !",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      blurRadius: 3,
                      color: Colors.black45,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
              ),
              SizedBox(height: 6),
              Text(
                "বাংলা সাহিত্যের অনবদ্য কিছু গল্প উপভোগ করুন ✨",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  shadows: [

                  ],
                ),
              ),

              SizedBox(height: 30),

              // 🔹 White section for categories
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white54.withOpacity(0.93),
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "📖 আপনার পছন্দের বিভাগ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B79A1),
                        ),
                      ),
                      SizedBox(height: 20),

                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookListPage(),
                                  ),
                                );
                              },
                              child: buildCard(
                                  Icons.menu_book, "সব গল্প", Colors.deepPurple),
                            ),
                            buildCard(
                                Icons.favorite, "পছন্দের বই", Colors.pinkAccent),
                            buildCard(Icons.star, "জনপ্রিয় বই", Colors.orange),
                            buildCard(Icons.info, "আমাদের সম্পর্কে", Colors.teal),
                          ],
                        ),
                      ),

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8E44AD),
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 6,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookListPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.menu_book, color: Colors.white),
                        label: Text(
                          "গল্পের বই দেখুন",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Drawer item builder
  Widget buildDrawerItem(IconData icon, String title, BuildContext context,
      {Widget? page}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context); // close drawer
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
  }

  // 🔹 Helper for category cards
  Widget buildCard(IconData icon, String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 38),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
