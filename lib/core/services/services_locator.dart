import 'package:film_gamed_app/movie/data/data_sources/movie_remote_data_source.dart';
import 'package:film_gamed_app/movie/data/repositories/movies_repositories.dart';
import 'package:film_gamed_app/movie/domain/repositories/base_movie_repository.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_movie_details_usecase.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_recommendation_usecase.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_top_rated_movies_usecase.dart';
import 'package:film_gamed_app/movie/presentation/manager/movie_detail_bloc.dart';
import 'package:film_gamed_app/movie/presentation/manager/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //*Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailBloc(sl(), sl()));

    //* UseCases
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    //* Repository
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepositories(sl()));

    //* DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
