import 'package:flutter/material.dart';
import 'package:task_validation/constants/custome_colors.dart';
import 'package:task_validation/views/help_and_support.dart';
import 'package:task_validation/views/youtube_videos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(
        primaryColor: CustomColors.primary,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(CustomColors.primary),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.primary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.primary, width: 2.0),
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HelpAndSupportPage(),
    const YoutubeVideosPage(),
    const DummyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.background,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Help & Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Dummy',
          ),
        ],
        currentIndex: _selectedIndex,
        elevation: 5,
        selectedItemColor: CustomColors.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DummyPage extends StatelessWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.background,
        title: const Text(
          'Dummy Page',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: const Center(
        child: Text(
          'Nothing here',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
