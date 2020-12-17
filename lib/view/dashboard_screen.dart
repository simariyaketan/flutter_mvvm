import 'package:flutter/material.dart';
import 'package:pra_task/viewmodel/MovieListViewModel.dart';
import 'package:provider/provider.dart';

import 'dashboard_list_page.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies",
        home:
        ChangeNotifierProvider(
          create: (context) => MovieListViewModel(),
          child: DashboardListPage(),
        )
    );
  }
}