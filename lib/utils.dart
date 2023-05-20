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

  static String parseStatInDesc(String data, List<List<double>> params) {
    data.replaceAll(RegExp(r'\\n'), "");
    if (data.contains(RegExp(r'#[0-9]+\[i\]'))) {
      List<String> dataVec = data.split(" ");
      int index = 0;
      for (final word in dataVec) {
        if (word.contains(RegExp(r'#[0-9]+\[i\]'))) {
          if (word.contains("%")) {
            final wordVec = word.split("[i]");
            final skillIndex = int.parse(wordVec[0].replaceAll("#", ""));
            dataVec[index] =
                "${(params[0][skillIndex - 1] * 100).toInt().toString()}%";
          } else {
            final wordVec = word.split("[i]");
            final skillIndex = int.parse(wordVec[0].replaceAll("#", ""));
            dataVec[index] = (params[0][skillIndex - 1]).toInt().toString();
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
