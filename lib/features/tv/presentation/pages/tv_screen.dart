import 'package:animate_do/animate_do.dart';
import 'package:film_gamed_app/features/tv/presentation/widgets/tv_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/routes_manger.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/enums.dart';
import '../manager/tv_bloc.dart';
import '../manager/tv_state.dart';
import '../widgets/on_the_air_widget.dart';

class TVsScreen extends StatelessWidget {
  const TVsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      key: const Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OnTheAirWidget(),
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
                      Routes.tvsList,
                      arguments: TvArgs(
                        AppString.popular,
                        BlocProvider.of<TVsBloc>(context).state.popularTVs,
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
          BlocBuilder<TVsBloc, TVsState>(
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
                  return TvListViewWidget(
                    tvs: state.popularTVs,
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
                      Routes.tvsList,
                      arguments: TvArgs(
                        AppString.topRated,
                        BlocProvider.of<TVsBloc>(context).state.topRatedTVs,
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
          BlocBuilder<TVsBloc, TVsState>(
            buildWhen: (previous, current) =>
                previous.topRatedTVsState != current.topRatedTVsState,
            builder: (context, state) {
              switch (state.topRatedTVsState) {
                case RequestState.loading:
                  return FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  );
                case RequestState.loaded:
                  return TvListViewWidget(
                    tvs: state.topRatedTVs,
                  );
                case RequestState.error:
                  return Text(state.topRatedMessage);
              }
            },
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
