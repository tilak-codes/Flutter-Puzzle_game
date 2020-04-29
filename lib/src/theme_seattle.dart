import 'core/puzzle_proxy.dart';
import 'flutter.dart';
import 'shared_theme.dart';
import 'widgets/decoration_image_plus.dart';

class ThemeSeattle extends SharedTheme {
  @override
  String get name => 'Udta Robot';

  const ThemeSeattle();

  @override
  Color get puzzleThemeBackground =>  Colors.black87;

  @override
  Color get puzzleBackgroundColor => Colors.yellowAccent;

  @override
  Color get puzzleAccentColor => const Color(0xff000579f);

  @override
  RoundedRectangleBorder puzzleBorder(bool small) =>
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(1),
        ),
      );

  @override
  EdgeInsetsGeometry tilePadding(PuzzleProxy puzzle) =>
      puzzle.solved ? const EdgeInsets.all(1) : const EdgeInsets.all(4);

  @override
  Widget tileButton(int i, PuzzleProxy puzzle, bool small) {
    if (i == puzzle.tileCount && !puzzle.solved) {
      assert(puzzle.solved);
    }

    final decorationImage = DecorationImagePlus(
        puzzleWidth: puzzle.width,
        puzzleHeight: puzzle.height,
        pieceIndex: i,
        fit: BoxFit.cover,
        image: const AssetImage('asset/seattle.jpg'));

    final correctPosition = puzzle.isCorrectPosition(i);
    final content = createInk(
      puzzle.solved
          ? const Center()
          : Container(
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: correctPosition ? Colors.black38 : Colors.white54,
        ),
        alignment: Alignment.center,
        child: Text(
          (i + 1).toString(),
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: correctPosition ? Colors.white : Colors.black,
            fontSize: small ? 25 : 42,
          ),
        ),
      ),
      image: decorationImage,
      padding: EdgeInsets.all(small ? 20 : 32),
    );

    return createButton(puzzle, small, i, content);
  }
}