class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String nowPlayingMovie = '$baseUrl/movie/now_playing?';
  static const String popularMovie = '$baseUrl/movie/popular?';
  static const String topRatedMovie = '$baseUrl/movie/top_rated?';

  static const String onTheAirTV = '$baseUrl/tv/on_the_air?';
  static const String popularTV = '$baseUrl/tv/popular?';
  static const String topRatedTV = '$baseUrl/tv/top_rated?';

  static String movieDetail(int movieId) => '$baseUrl/movie/$movieId?';
  static String recommendationMovie(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?';

  static String tvDetail(int tvId) => '$baseUrl/tv/$tvId?';
  static String recommendationTV(int tvId) =>
      '$baseUrl/tv/$tvId/recommendations?';

  static const String apiKey = 'api_key=e2e1e17d092a6b8193f6e106638afd7a';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
