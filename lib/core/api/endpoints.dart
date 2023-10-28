/// A utility class containing API endpoints.
///
/// This class centralizes all the endpoints used in the application
/// for the base API,
/// which in this case is `https://dog.ceo/$dataPath/`.
class EndPoints {
  /// The base URL for API requests.
  ///
  /// The [dataPath] is dynamically appended to this URL.
  static String baseUrl = 'https://dog.ceo/$dataPath/';

  /// The common path in the API that is appended to [baseUrl].
  static const String dataPath = 'api/breed';

  /// Endpoint to get a random dog data.
  static const String randomEndPoint = 'random';

  /// Endpoint to get an image of a dog.
  static const String imageEndPoint = 'image';

  /// Endpoint to get random dog images.
  static const String randomImagesEndPoint = 'image/random';
}
