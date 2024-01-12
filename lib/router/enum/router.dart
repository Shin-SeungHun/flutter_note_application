/// router Path,Name 설정
enum Router {
  mainScreen,
  addScreen,
  editScreen,
}


extension RouterExtension on Router {
  /// router Path 설정
  String get path {
    switch (this) {
      case Router.mainScreen:
        return '/';
      case Router.addScreen:
        return '/addScreen';
      case Router.editScreen:
        return '/editScreen/:id';
      default:
        throw ArgumentError('Invalid router');
    }
  }

  /// router Name 설정
  String get name {
    switch (this) {
      case Router.mainScreen:
        return 'mainScreen';
      case Router.addScreen:
        return 'addScreen';
      case Router.editScreen:
        return 'editScreen';
      default:
        throw ArgumentError('Invalid router');
    }
  }
}
