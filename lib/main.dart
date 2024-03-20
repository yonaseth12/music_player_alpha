import 'package:flutter/material.dart';
import 'package:music_player_alpha/pages/albumView.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:music_player_alpha/pages/home.dart';
import 'package:music_player_alpha/pages/library.dart';
import 'package:music_player_alpha/pages/profile.dart';
import 'package:music_player_alpha/pages/search.dart';


void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatefulWidget {
  const MusicApp({super.key});

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedAlbumProvider(),),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          brightness: Brightness.dark,
        ),
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes:[
    GoRoute(path: "/home", builder:((context, state) => const Home())),
    GoRoute(path: "/search", builder:((context, state) => const Search())),
    GoRoute(path: "/library", builder:((context, state) => const Library())),
    GoRoute(path: "/profile", builder:((context, state) => const Profile())),
    GoRoute(path: "/album_view", builder:((context, state) => const AlbumView())),
  ],
); 




