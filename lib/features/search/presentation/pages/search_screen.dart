import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/network/api_constance.dart';
import '../../../../core/resources/routes_manger.dart';
import '../../../../core/utils/enums.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => BlocProvider.of<SearchBloc>(context)
                    .add(GetSearchDateEvent(value)),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white12,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.7)),
                  ),
                ),
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                switch (state.searchState) {
                  case RequestState.loading:
                    return FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    );
                  case RequestState.loaded:
                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.searchData.length,
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              if (state.searchData[index].mediaType ==
                                  'movie') {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.movieDetailRoute,
                                  arguments: state.searchData[index].id,
                                );
                              } else if (state.searchData[index].mediaType ==
                                  'tv') {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.tvDetailRoute,
                                  arguments: state.searchData[index].id,
                                );
                              }
                            },
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          fit: BoxFit.cover,
                                          imageUrl: ApiConstance.imageUrl(state
                                              .searchData[index].backdropPath),
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor:
                                                Theme.of(context).shadowColor,
                                            highlightColor: Theme.of(context)
                                                .highlightColor,
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
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              state.searchData[index].title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Text(
                                                  state.searchData[index]
                                                      .mediaType,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  state.searchData[index]
                                                      .releaseDate,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    );
                  case RequestState.error:
                    return Center(child: Text(state.searchMessage));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
