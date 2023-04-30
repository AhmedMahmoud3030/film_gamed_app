// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/network/api_constance.dart';
import '../../../../core/resources/routes_manger.dart';

class MovieList extends StatelessWidget {
  final MovieArgs moviesArgs;
  const MovieList({Key? key, required this.moviesArgs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Conditional.single(
            context: context,
            conditionBuilder: (context) => moviesArgs.movies.isNotEmpty,
            widgetBuilder: (context) => Column(
              children: [
                Text(
                  moviesArgs.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: moviesArgs.movies.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                              context,
                              Routes.movieDetailRoute,
                              arguments: moviesArgs.movies[index].id,
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0)),
                                    child: CachedNetworkImage(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      fit: BoxFit.cover,
                                      imageUrl: ApiConstance.imageUrl(moviesArgs
                                          .movies[index].backdropPath),
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                        baseColor:
                                            Theme.of(context).shadowColor,
                                        highlightColor:
                                            Theme.of(context).highlightColor,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          moviesArgs.movies[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          moviesArgs.movies[index].releaseDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
            fallbackBuilder: (context) => const Center(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
