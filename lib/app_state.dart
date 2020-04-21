class AppState {
  bool isLoading;
  String user;

  //Constructor
  AppState({this.isLoading = false, this.user});

  //A constructor for when the app is loading
  factory AppState.loading() => new AppState(isLoading: true);

  @override
  String toString() {
    return 'AppState(isLoading: $isLoading, user: $user';
  }
}
