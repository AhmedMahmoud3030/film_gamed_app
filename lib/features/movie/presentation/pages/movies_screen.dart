import 'package:animate_do/animate_do.dart';
import 'package:film_gamed_app/core/utils/app_string.dart';
import 'package:film_gamed_app/features/movie/presentation/widgets/movie_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/routes_manger.dart';
import '../../../../core/utils/enums.dart';
import '../manager/movies_bloc.dart';
import '../manager/movies_state.dart';
import '../widgets/now-playing_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      key: const Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NowPlayingWidget(),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.popular,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.moviesList,
                      arguments: MovieArgs(
                        AppString.popular,
                        BlocProvider.of<MoviesBloc>(context)
                            .state
                            .popularMovies,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          AppString.seeMore,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16.0)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<MoviesBloc, MoviesState>(
            buildWhen: (previous, current) =>
                previous.popularMoviesState != current.popularMoviesState,
            builder: (context, state) {
              switch (state.popularMoviesState) {
                case RequestState.loading:
                  return FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  );
                case RequestState.loaded:
                  return MovieListViewWidget(
                    movies: state.popularMovies,
                  );
                case RequestState.error:
                  return Text(state.popularMessage);
              }
            },
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(
              16.0,
              24.0,
              16.0,
              8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.topRated,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.moviesList,
                      arguments: MovieArgs(
                        AppString.topRated,
                        BlocProvider.of<MoviesBloc>(context)
                            .state
                            .topRatedMovies,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          AppString.seeMore,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<MoviesBloc, MoviesState>(
            buildWhen: (previous, current) =>
                previous.topRatedMoviesState != current.topRatedMoviesState,
            builder: (context, state) {
              switch (state.topRatedMoviesState) {
                case RequestState.loading:
                  return FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  );
                case RequestState.loaded:
                  return MovieListViewWidget(
                    movies: state.topRatedMovies,
                  );
                case RequestState.error:
                  return Text(state.popularMessage);
              }
            },
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
