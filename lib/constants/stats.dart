enum StatType {
  atk,
  def,
  hp,
  spd,
  cd,
  cr,
  ehr,
  def1,
  hp1,
  atk1,
  fdb, //Fire Damage Bonus
  idb, //Ice Damage Bonus
  imdb, //Imaginary Damage Bonus
  ldb, //Lightning Damage Bonus
  pdb, //Physical Damage Bonus
  qdb, //Quantum Damage Bonus
  wdb //Wind Damage Bonus
}

class Stat {
  final String name;
  final String shortName;
  final StatType statType;
  final bool? isPercent;
  Stat(
      {required this.name,
      required this.statType,
      required this.shortName,
      this.isPercent = false}) {}

  @override
  String toString() {
    return name;
  }
}

class StatList {
  final List<Stat> stats = [
    Stat(
      name: "ATK",
      shortName: "ATK",
      statType: StatType.atk,
    ),
    Stat(
      name: "DEF",
      shortName: "DEF",
      statType: StatType.def,
    ),
    Stat(
      name: "HP",
      shortName: "HP",
      statType: StatType.hp,
    ),
    Stat(
      name: "Speed",
      shortName: "SPD",
      statType: StatType.spd,
    ),
    Stat(
      name: "Crit DMG",
      shortName: "CD",
      statType: StatType.cd,
      isPercent: true,
    ),
    Stat(
      name: "Crit Rate",
      shortName: "CR",
      statType: StatType.cr,
      isPercent: true,
    ),
    Stat(
      name: "Effect Hit Rate",
      shortName: "EHR",
      statType: StatType.ehr,
      isPercent: true,
    ),
    Stat(
      name: "DEF%",
      shortName: "DEF%",
      statType: StatType.def1,
      isPercent: true,
    ),
    Stat(
      name: "HP%",
      shortName: "HP%",
      statType: StatType.hp1,
      isPercent: true,
    ),
    Stat(
      name: "ATK%",
      shortName: "ATK%",
      statType: StatType.atk1,
      isPercent: true,
    ),
    Stat(
      name: "Fire DMG Bonus %",
      shortName: "Fire DMG %",
      statType: StatType.fdb,
      isPercent: true,
    ),
    Stat(
      name: "Ice DMG Bonus %",
      shortName: "Ice DMG %",
      statType: StatType.idb,
      isPercent: true,
    ),
    Stat(
      name: "Imaginary DMG Bonus %",
      shortName: "Imaginary DMG %",
      statType: StatType.imdb,
      isPercent: true,
    ),
    Stat(
      name: "Lightning DMG Bonus %",
      shortName: "Lightning DMG %",
      statType: StatType.ldb,
      isPercent: true,
    ),
    Stat(
      name: "Physical DMG Bonus %",
      statType: StatType.pdb,
      shortName: "Physical DMG %",
      isPercent: true,
    ),
    Stat(
      name: "Quantum DMG Bonus%",
      statType: StatType.qdb,
      shortName: "Quantum DMG %",
      isPercent: true,
    ),
    Stat(
      name: "Wind DMG Bonus%",
      statType: StatType.wdb,
      shortName: "Wind DMG %",
      isPercent: true,
    ),
  ];
}
