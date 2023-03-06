import 'package:film_gamed_app/features/tv/presentation/manager/tv_bloc.dart';
import 'package:film_gamed_app/features/tv/presentation/manager/tv_event.dart';
import 'package:film_gamed_app/features/tv/presentation/widgets/on_the_air_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/popular_widget.dart';
import '../widgets/toprated_widget.dart';

class TVsScreen extends StatelessWidget {
  const TVsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TVsBloc>()
        ..add(GetOnTheAirTVsEvent())
        ..add(GetPopularTVsEvent())
        ..add(GetTopRatedTVsEvent()),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        key: Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OnTheAirWidget(),
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
                      /// TODO : NAVIGATION TO POPULAR SCREEN
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            AppString.seeMore,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Icon(Icons.arrow_forward_ios, size: 16.0)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const PopularWidget(),
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
                      /// TODO : NAVIGATION TO Top Rated Movies Screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            AppString.seeMore,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Icon(
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
            const TopRatedWidget(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
