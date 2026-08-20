class AppRoutes {
  AppRoutes._();

  static const splash = '/';
  static const login = '/login';
  static const passwords = '/passwords';
  static const addPassword = '/add-password';
  static const passwordDetails = '/passwords/:id';
  static const favourites = '/favourites';
  static const favouritePasswordDetails = '/favourites/:id';
  static const categories = '/categories';
  static const categoryDetails = '/categories/:id';
  static const categoryPasswordDetails =
      '/categories/:categoryId/passwords/:passwordId';
  static const settings = '/settings';
  static const privacyPolicy = '/settings/privacy-policy';

  static String passwordDetailsPath(String id) => '/passwords/$id';
  static String favouritePasswordDetailsPath(String id) => '/favourites/$id';
  static String categoryDetailsPath(String id) => '/categories/$id';
  static String categoryPasswordDetailsPath(
    String categoryId,
    String passwordId,
  ) => '/categories/$categoryId/passwords/$passwordId';
}
