class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'api_key=e2e1e17d092a6b8193f6e106638afd7a';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static const String multiSearch = '$baseUrl/search/multi?$apiKey';
  static String search(String searchString) =>
      '$multiSearch&query=$searchString&language=en-US';

  static const String nowPlayingMovie =
      '$baseUrl/movie/now_playing?$apiKey&language=en-US';
  static const String popularMovie =
      '$baseUrl/movie/popular?$apiKey&language=en-US';
  static const String topRatedMovie =
      '$baseUrl/movie/top_rated?$apiKey&language=en-US';

  static const String onTheAirTV =
      '$baseUrl/tv/on_the_air?$apiKey&language=en-US';
  static const String popularTV = '$baseUrl/tv/popular?$apiKey&language=en-US';
  static const String topRatedTV =
      '$baseUrl/tv/top_rated?$apiKey&language=en-US';

  static String movieDetail(int movieId) =>
      '$baseUrl/movie/$movieId?$apiKey&language=en-US';
  static String recommendationMovie(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?$apiKey&language=en-US';

  static String tvDetail(int tvId) =>
      '$baseUrl/tv/$tvId?$apiKey&language=en-US';
  static String recommendationTV(int tvId) =>
      '$baseUrl/tv/$tvId/recommendations?$apiKey&language=en-US';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
