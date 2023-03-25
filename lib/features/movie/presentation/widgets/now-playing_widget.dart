// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:film_gamed_app/core/resources/routes_manger.dart';
import 'package:film_gamed_app/core/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/api_constance.dart';
import '../../../../core/utils/enums.dart';
import '../manager/movies_bloc.dart';
import '../manager/movies_state.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingMoviesState != current.nowPlayingMoviesState,
      builder: (context, state) {
        switch (state.nowPlayingMoviesState) {
          case RequestState.loading:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: Container(
                height: MediaQuery.of(context).size.height,
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.89,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.movieDetailRoute,
                          arguments: item.id,
                        );
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  // Theme.of(context).primaryColor,
                                  // Theme.of(context).scaffoldBackgroundColor,
                                  // Theme.of(context).scaffoldBackgroundColor,
                                  // Theme.of(context).primaryColor,
                                  Colors.transparent,
                                  Colors.pink,
                                  Colors.pink,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: MediaQuery.of(context).size.height * 0.89,
                              imageUrl:
                                  ApiConstance.imageUrl(item.backdropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        AppString.nowPlaying.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );

          case RequestState.error:
            return Text(state.nowPlayingMessage);
        }
      },
    );
  }
}
