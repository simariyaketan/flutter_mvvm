import 'package:flutter/material.dart';
import 'package:pra_task/resource/TxtStyle.dart';
import 'package:pra_task/resource/color.dart';
import 'package:pra_task/resource/dimens.dart';
import 'package:pra_task/viewmodel/MovieListViewModel.dart';

class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;

  MovieList({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      physics: BouncingScrollPhysics(
          parent:
          AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, index) {
        final movie = this.movies[index];

        return Container(
            margin: EdgeInsets.only(
                left: dimens_20, right: dimens_20, top: dimens_20),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: color_f4f6fa,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 7.0,
                        color: color_E0E5F4, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    )),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(movie.poster)),
                        borderRadius: BorderRadius.circular(6)),
                    width: 50,
                    height: 100,
                  ),
                  title: Text(movie.title,style: BranGrotReg16292F32,),
                )));
      },
    );
  }
}
