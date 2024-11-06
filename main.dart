import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key}); 
  @override
  State<MyApp> createState() => MyAppState();
}
class MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;  // Varsayılan olarak light tema 
  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }
  @override
  Widget build(Object context) {
    return MaterialApp(
      title: 'Theme Switch',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.dark,
      ),
      themeMode: themeMode, // Aktif tema durumu burada kullanılıyor
      home: ThemeSwitch(onToggleTheme: toggleTheme),
    );
  }
}
class CustomButton extends StatelessWidget {
  final String clock;
  final String firstTeam;
  final IconData icon;
  final String secondTeam;

  const CustomButton({
    super.key,
    required this.clock,
    required this.firstTeam,
    this.icon = Icons.keyboard_arrow_down_rounded,
    required this.secondTeam,
  });
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onPrimary;
    final backgroundColor = colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              clock,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  firstTeam,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 5),
                Icon(
                  icon,
                  color: textColor,
                ),
                const SizedBox(width: 5),
                Text(
                  secondTeam,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class ThemeSwitch extends StatelessWidget {
  final VoidCallback onToggleTheme; // Tema değiştirme
  const ThemeSwitch({super.key, required this.onToggleTheme}); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.purple,
        title: const Text('Theme Switch'),
        actions: [
          IconButton(
            onPressed: onToggleTheme,
            icon: const Icon(Icons.brightness_6),
            iconSize: 40,
            padding: const EdgeInsets.only(right: 30),
          ),
        ],
      ),
      body: const Column(
        children: [
          CustomButton(clock: "15:00", firstTeam: "Sakaryaspor", secondTeam: "İstanbulspor"),
          CustomButton(clock: "17:00", firstTeam: "Samsunspor", secondTeam: "Fenerbahçe"),
          CustomButton(clock: "19:00", firstTeam: "Galatasaray", secondTeam: "Antalyaspor"),
          CustomButton(clock: "21:00", firstTeam: "Kasımpaşa", secondTeam: "Beşiktaş"),
          CustomButton(clock: "15:00", firstTeam: "Liverpool", secondTeam: "Brighton"),
          CustomButton(clock: "17:00", firstTeam: "Man. City", secondTeam: "Arsenal"),
          CustomButton(clock: "19:00", firstTeam: "Fulham", secondTeam: "Brentford"),
          CustomButton(clock: "17:00", firstTeam: "Atl. Madrid", secondTeam: "Las Palmas"),
          CustomButton(clock: "19:00", firstTeam: "Barcelona", secondTeam: "Espanyol"),
          CustomButton(clock: "21:00", firstTeam: "Ath. Bilbao", secondTeam: "Real Betis"),
        ],
      ),
    );
  }
}