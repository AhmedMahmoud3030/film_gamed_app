import 'package:get_it/get_it.dart';

import '../../features/movie/data/data_sources/movie_remote_data_source.dart';
import '../../features/movie/data/repositories/movies_repositories.dart';
import '../../features/movie/domain/repositories/base_movie_repository.dart';
import '../../features/movie/domain/use_cases/get_movie_details_usecase.dart';
import '../../features/movie/domain/use_cases/get_now_playing_movies_usecase.dart';
import '../../features/movie/domain/use_cases/get_popular_movies_usecase.dart';
import '../../features/movie/domain/use_cases/get_recommendation_usecase.dart';
import '../../features/movie/domain/use_cases/get_top_rated_movies_usecase.dart';
import '../../features/movie/presentation/manager/movie_detail_bloc.dart';
import '../../features/movie/presentation/manager/movies_bloc.dart';
import '../../features/tv/data/data_sources/tv_remote_data_source.dart';
import '../../features/tv/data/repositories/tv_repositories.dart';
import '../../features/tv/domain/repositories/base_tv_repository.dart';
import '../../features/tv/domain/use_cases/get_on_the_air_tv_usecase.dart';
import '../../features/tv/domain/use_cases/get_popular_tv_usecase.dart';
import '../../features/tv/domain/use_cases/get_recommendation_tv_usecase.dart';
import '../../features/tv/domain/use_cases/get_top_rated_tv_usecase.dart';
import '../../features/tv/domain/use_cases/get_tv_details_usecase.dart';
import '../../features/tv/presentation/manager/tv_bloc.dart';
import '../../features/tv/presentation/manager/tv_detail_bloc.dart';


final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //?Movies
    //*Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailBloc(sl(), sl()));

    //* UseCases
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMovieUseCase(sl()));

    //* Repository
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepositories(sl()));

    //* DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    //?TVs
    //*Bloc
    sl.registerFactory(() => TVsBloc(sl(), sl(), sl()));
    sl.registerFactory(() => TVDetailBloc(sl(), sl()));

    //* UseCases
    sl.registerLazySingleton(() => GetOnTheAirTvUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTVsUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTVsUseCase(sl()));
    sl.registerLazySingleton(() => GetTVDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationTVUseCase(sl()));

    //* Repository
    sl.registerLazySingleton<BaseTVRepository>(() => TVRepositories(sl()));

    //* DataSource
    sl.registerLazySingleton<BaseTVRemoteDataSource>(
        () => TVRemoteDataSource());
  }
}
