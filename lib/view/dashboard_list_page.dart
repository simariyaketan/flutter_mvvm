
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pra_task/resource/TxtStyle.dart';
import 'package:pra_task/resource/color.dart';
import 'package:pra_task/utils/Utils.dart';
import 'package:pra_task/viewmodel/MovieListViewModel.dart';
import 'package:pra_task/widgets/MovieList.dart';
import 'package:provider/provider.dart';

class DashboardListPage extends StatefulWidget {
  @override
  _DashboardListPageState createState() => _DashboardListPageState();
}

class _DashboardListPageState extends State<DashboardListPage>{

  final TextEditingController _searchcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getMovieListData();
  }

  _getMovieListData() async{
    bool connectivity = await GetInternetConnectivity();
    if (connectivity) {
      Provider.of<MovieListViewModel>(context, listen: false).fetchMovies(
          "batman");
    } else {
      ShowToast("Oops! No internet connection.", color_ffffff, color_000000);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text("Movies",style: BranGrotBold20ffffff,),),
          backgroundColor: color_E82925,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _searchcontroller,
                  onSubmitted: (value) {
                    if(value.isNotEmpty) {
                      vm.fetchMovies(value);
                      _searchcontroller.clear();
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none
                  ),

                ),
              ),
              Expanded(
                  child: MovieList(movies: vm.movies))
            ])
        )

    );
  }

}