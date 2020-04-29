import 'core/puzzle_proxy.dart';
import 'flutter.dart';
import 'shared_theme.dart';

const _accentBlue = Color(0xff000579e);

class ThemeSimple extends SharedTheme {
  @override
  String get name => 'Simple';

  const ThemeSimple();

  @override
  Color get puzzleThemeBackground => Colors.yellow;

  @override
  Color get puzzleBackgroundColor => Colors.lightGreenAccent;

  @override
  Color get puzzleAccentColor => _accentBlue;

  @override
  RoundedRectangleBorder puzzleBorder(bool small) =>
      const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black26, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      );

  @override
  Widget tileButton(int i, PuzzleProxy puzzle, bool small) {
    if (i == puzzle.tileCount) {
      assert(puzzle.solved);
      return const Center(
        child: Icon(
          Icons.thumb_up,
          size: 72,
          color: _accentBlue,
        ),
      );
    }

    final correctPosition = puzzle.isCorrectPosition(i);

    final content = createInk(
      Center(
        child: Text(
          (i + 1).toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: correctPosition ? FontWeight.bold : FontWeight.normal,
            fontSize: small ? 30 : 49,
          ),
        ),
      ),
    );

    return createButton(
      puzzle,
      small,
      i,
      content,
      color: const Color.fromARGB(255, 13, 87, 155),
    );
  }
}