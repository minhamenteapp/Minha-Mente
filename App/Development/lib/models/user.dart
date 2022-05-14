class User {
  final String username;
  final String email;
  final String fullname;
  final String password;

  User(
    this.username,
    this.email,
    this.fullname,
    this.password,
  );

  @override
  String toString() {
    return 'User{username: $username,   email: $email, fullname: $fullname, password: $password}';
  }
}
