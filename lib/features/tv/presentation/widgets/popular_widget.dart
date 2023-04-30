import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_gamed_app/features/tv/presentation/manager/tv_bloc.dart';
import 'package:film_gamed_app/features/tv/presentation/manager/tv_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/network/api_constance.dart';
import '../../../../core/resources/routes_manger.dart';
import '../../../../core/utils/enums.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TVsBloc, TVsState>(
      buildWhen: (previous, current) =>
          previous.popularTVsState != current.popularTVsState,
      builder: (context, state) {
        switch (state.popularTVsState) {
          case RequestState.loading:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularTVs.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularTVs[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.tvDetailRoute,
                            arguments: movie.id,
                          );
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.height * 0.2,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Theme.of(context).shadowColor,
                              highlightColor: Theme.of(context).highlightColor,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return Text(state.popularMessage);
        }
      },
    );
  }
}
