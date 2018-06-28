import 'package:igdb_wrapper/igdb_wrapper.dart';

main() {
  final IGDBWrapper wrapper = new IGDBWrapper(
      "API_KEY",
      version: Version.STANDARD,
      debug: true);

  final p = new Parameters().addSearch("zelda");

  wrapper.games(p).then((result) => print("result body: ${result.body}"));
}
