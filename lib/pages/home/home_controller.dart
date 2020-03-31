import 'package:flutter/material.dart';
import 'package:graphql_app/pages/boletos/boletos_screen.dart';
import 'package:graphql_app/pages/home/home_adm.dart';
import 'package:graphql_app/pages/home/home_screen.dart';
import 'package:graphql_app/utils/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeController extends StatefulWidget {
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onPageChanged(int page) {
    setState(() {
      this._currentIndex = page;
    });
  }

  _navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 399),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          HomeScreen(),
          BoletosScreen(),
          HomeAdmScreen(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.grey[200]),
        child: BottomNavigationBar(
          onTap: _navigationTapped,
          currentIndex: _currentIndex,
          selectedItemColor: Tema.corPrincipal,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: Tema.corPrincipal),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.currencyUsd),
              title: Text('Boletos'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Conta'),
            ),
          ],
        ),
      ),
    );
  }
}
