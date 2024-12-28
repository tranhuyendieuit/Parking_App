enum AppImages {
  logo,
  backgroundSplash,
  defaultAvatar,
}

extension AppImagesExtension on AppImages {
  String get webpAssetPath {
    return 'assets/images/img_${name.toString().replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)}').toLowerCase()}.webp';
  }
}
