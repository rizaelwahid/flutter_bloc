import 'package:flutter/material.dart';
import 'package:rizaelwahid/screens/navs/settings_sceen.dart';
import 'package:rizaelwahid/screens/navs/menu_screen.dart';
import 'package:rizaelwahid/screens/navs/profile_screen.dart';
import 'package:rizaelwahid/screens/navs/notification_screen.dart';
import 'package:rizaelwahid/screens/navs/home_screen.dart';
import 'package:rizaelwahid/style/theme.dart' as theme;
import 'package:rizaelwahid/bloc/auth_bloc/auth_bloc.dart';
import 'package:rizaelwahid/repositories/repositories.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizaelwahid/screens/auth/intro_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> pages = <Widget>[
    HomePage(),
    MenuPage(),
    ProfilePage(),
    NotificationPage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();
    AuthenticationBloc myAuthBloc = context.read<AuthenticationBloc>();
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,
            appBar: AppBar(
              title: const Text('Depedency Injection'),
              actions: [
                IconButton(
                  onPressed: () {
                    // BlocProvider.of<AuthenticationBloc>(context)
                    //     .add(LoggedOut());
                    myAuthBloc.add(LoggedOut());
                  },
                  icon: const Icon(EvaIcons.logOutOutline),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/other");
              },
              child: const Icon(Icons.arrow_forward),
            ),
            body: Center(
              child: pages.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.homeOutline),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.keypadOutline),
                  label: 'Menu',
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.personOutline),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.bellOutline),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.settingsOutline),
                  label: 'Setting',
                ),
              ],
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: theme.mainColor,
              unselectedIconTheme: IconThemeData(color: theme.mainColor05Opc),
              showUnselectedLabels: true,
              unselectedItemColor: theme.mainColor05Opc,
              elevation: 0,
              onTap: _onItemTapped,
            ),
          );
        }
        if (state is AuthenticationUnauthenticated) {
          return IntroPage(userRepository: userRepository);
        }
        if (state is AuthenticationLoading) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(theme.mainColor),
                      strokeWidth: 4.0,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(theme.mainColor),
                    strokeWidth: 4.0,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
