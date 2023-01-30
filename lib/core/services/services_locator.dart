import 'package:film_gamed_app/movie/data/data_sources/movie_remote_data_source.dart';
import 'package:film_gamed_app/movie/data/repositories/movies_repositories.dart';
import 'package:film_gamed_app/movie/domain/repositories/base_movie_repository.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_top_rated_movies_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //* UseCases
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    //* Repository
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepositories(sl()));

    //* DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
