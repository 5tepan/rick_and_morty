import 'package:base_flutter_proj/core/assets/app_asset.dart';

/// Единый каталог локальных иконок и растровых ассетов.
abstract final class AppAssets {
  static const _icons = 'assets/icons';

  // --- Vector (SVG) ---

  static const home = AppAsset('$_icons/ic_home.svg', AppAsset.vector);
  static const user = AppAsset('$_icons/ic_user.svg', AppAsset.vector);
  static const shoppingCart = AppAsset(
    '$_icons/ic_shopping_cart.svg',
    AppAsset.vector,
  );
  static const arrowRight = AppAsset(
    '$_icons/ic_arrow_right.svg',
    AppAsset.vector,
  );

  static const arrowBack = AppAsset(
    '$_icons/ic_arrow_back.svg',
    AppAsset.vector,
  );
  static const close = AppAsset('$_icons/ic_close.svg', AppAsset.vector);
  static const logout = AppAsset('$_icons/ic_logout.svg', AppAsset.vector);
  static const share = AppAsset('$_icons/ic_share.svg', AppAsset.vector);
  static const link = AppAsset('$_icons/ic_link.svg', AppAsset.vector);
  static const search = AppAsset('$_icons/ic_search.svg', AppAsset.vector);
  static const clear = AppAsset('$_icons/ic_clear.svg', AppAsset.vector);
  static const history = AppAsset('$_icons/ic_history.svg', AppAsset.vector);
  static const inbox = AppAsset('$_icons/ic_inbox.svg', AppAsset.vector);
  static const attachFile = AppAsset(
    '$_icons/ic_attach_file.svg',
    AppAsset.vector,
  );

  // --- Raster (PNG) ---

  static const logo = AppAsset('assets/ic_logo.png', AppAsset.raster);
  static const placeholder = AppAsset(
    'assets/placeholder.png',
    AppAsset.raster,
  );
  static const inDevelopment = AppAsset(
    'assets/ic_in_developing.png',
    AppAsset.raster,
  );

  /// Ассеты для предзагрузки при старте (tab bar, auth, placeholders).
  static const List<AppAsset> preloadable = [
    home,
    user,
    shoppingCart,
    arrowRight,
    arrowBack,
    close,
    logout,
    share,
    search,
    inbox,
    logo,
    placeholder,
    inDevelopment,
  ];
}
