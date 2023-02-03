class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String nowPlayingMovie = '$baseUrl/movie/now_playing?';
  static const String popularMovie = '$baseUrl/movie/popular?';
  static const String topRatedMovie = '$baseUrl/movie/top_rated?';
  static String movieDetail(int movieId) => '$baseUrl/movie/$movieId?';
  static String recommendation(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?';
  static const String apiKey = 'api_key=e2e1e17d092a6b8193f6e106638afd7a';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
