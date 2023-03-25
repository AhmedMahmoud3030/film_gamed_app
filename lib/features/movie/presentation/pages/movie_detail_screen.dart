import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../../../core/network/api_constance.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/generes.dart';
import '../manager/movie_detail_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetMovieRecommendationEvent(id)),
      lazy: false,
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        switch (state.movieDetailState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              key: const Key('movieDetailScrollView'),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstance.imageUrl(
                              state.movieDetail!.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.movieDetail!.title,
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).shadowColor,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  state.movieDetail!.releaseDate.split('-')[0],
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    (state.movieDetail!.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(width: 8.0),
                                  const Icon(
                                    SimpleIcons.hbo,
                                    size: 25.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    (state.movieDetail!.voteAverage)
                                        .toStringAsFixed(1),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 24.0),
                              const Icon(
                                FeatherIcons.clock,
                                size: 25.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                _showDuration(state.movieDetail!.runtime),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(state.movieDetail!.overview,
                              style: Theme.of(context).textTheme.displaySmall),
                          const SizedBox(height: 8.0),
                          Text(
                              '${AppString.genres}: ${_showGenres(state.movieDetail!.genres)}',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        AppString.moreLikeThis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
                // Tab(text: 'More like this'.toUpperCase()),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: _showRecommendations(),
                ),
              ],
            );
          case RequestState.error:
            return Center(child: Text(state.movieDetailMessage));
        }
      },
    );
  }

  String _showGenres(List<GenresMovie> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showRecommendations() {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) => SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final recommendation = state.recommendation[index];
            return FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: CachedNetworkImage(
                  imageUrl: ApiConstance.imageUrl(recommendation.backdropPath!),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 170.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          childCount: state.recommendation.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
