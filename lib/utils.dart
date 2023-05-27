import 'dart:developer';

abstract class Utils {
  static String convertPathName(String path) {
    switch (path) {
      case 'Knight':
        return 'Preservation';
      case 'Shaman':
        return 'Harmony';
      case 'Rogue':
        return 'Hunt';
      case 'Mage':
        return 'Erudition';
      case 'Priest':
        return 'Abundance';
      case 'Warlock':
        return 'Nihility';
      case 'Warrior':
        return 'Destruction';
      default:
        return 'None';
    }
  }

  static String parseGeneralStatInDesc(String data, List<List<double>> params) {
    RegExp normalExp = RegExp(r'#[0-9]+\[i\]');

    RegExp percentExp = RegExp(r'#[0-9]+\[i\]%');

    RegExp floatExp = RegExp(r'#[0-9]+\[f\]');

    List<Match> normalMatches = normalExp.allMatches(data).toList();
    Iterable<Match> percentMatches = percentExp.allMatches(data);
    List<Match> floatMatches = floatExp.allMatches(data).toList();

    normalMatches.removeWhere((element) {
      for (final match in percentMatches) {
        if (match[0]!.contains(element[0]!)) {
          return true;
        }
      }
      return false;
    });

    String iterString = data;

    for (final match in normalMatches) {
      log(match[0] ?? 'no match value');
      String numString = match[0]!
          .replaceAll("#", "")
          .replaceAll("[i]", "")
          .replaceAll("[f]", "");

      int index = int.parse(numString) - 1;

      log(numString);
      iterString =
          iterString.replaceAll(match[0]!, params[0][index].toString());
    }

    for (final match in percentMatches) {
      log(match[0] ?? 'no match value');
      String numString = match[0]!
          .replaceAll("#", "")
          .replaceAll("[i]", "")
          .replaceAll("[f]", "")
          .replaceAll("%", "");

      int index = int.parse(numString) - 1;

      log(numString);
      iterString = iterString.replaceAll(
          match[0]!, "${(params[0][index] * 100).toString()}%");
    }

    for (final match in floatMatches) {
      log(match[0] ?? 'no match value');
      String numString = match[0]!
          .replaceAll("#", "")
          .replaceAll("[i]", "")
          .replaceAll("[f]", "")
          .replaceAll("%", "");

      int index = int.parse(numString) - 1;

      log(numString);
      iterString =
          iterString.replaceAll(match[0]!, (params[0][index]).toString());
    }

    return iterString;
  }

  static String parseRelicStatInDesc(String data, List<double> params) {
    data.replaceAll(RegExp(r'\\n'), "\n");
    if (data.contains(RegExp(r'#[0-9]+\[i\]'))) {
      List<String> dataVec = data.split(" ");
      int index = 0;
      for (final word in dataVec) {
        if (word.contains(RegExp(r'#[0-9]+\[i\]'))) {
          if (word.contains("%")) {
            final wordVec = word.split("[i]");
            final skillIndex = int.parse(wordVec[0].replaceAll("#", ""));
            dataVec[index] =
                "${(params[skillIndex - 1] * 100).toInt().toString()}%";
          } else {
            final wordVec = word.split("[i]");
            final skillIndex = int.parse(wordVec[0].replaceAll("#", ""));
            dataVec[index] = (params[skillIndex - 1]).toInt().toString();
          }
        }
        index++;
      }

      return dataVec.join(" ");
    }
    return data;
  }

  static String convertSkillType(String skill) {
    switch (skill) {
      case 'Normal':
        return 'Basic Attack';

      case 'BPSkill':
        return 'Skill';

      case 'Ultra':
        return 'Ultimate';

      case 'MazeNormal':
        return 'Passive';

      case 'Maze':
        return 'Passive';

      default:
        return 'Follow up';
    }
  }
}
