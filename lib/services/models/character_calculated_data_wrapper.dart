class CharacterCalculatedDataWrapper {
  final double atk;
  final double def;
  final double hp;
  final double critDmg;
  final double critRate;
  final DamageBonuses damageBonuses;
  CharacterCalculatedDataWrapper(this.atk, this.def, this.hp, this.critDmg,
      this.critRate, this.damageBonuses);

  CharacterCalculatedDataWrapper copyWith(double? atk, double? def, double? hp,
          double? critDmg, double? critRate, DamageBonuses? damageBonuses) =>
      CharacterCalculatedDataWrapper(
        atk ?? this.atk,
        def ?? this.def,
        hp ?? this.hp,
        critDmg ?? this.critDmg,
        critRate ?? this.critRate,
        damageBonuses ?? this.damageBonuses,
      );
}

class DamageBonuses {
  final double fireDmgBonus;
  final double iceDmgBonus;
  final double windDmgBonus;
  final double physicalDmgBonus;
  final double imaginaryDmgBonus;
  final double quantumDmgBonus;
  final double lightningDmgBonus;
  DamageBonuses(
    this.fireDmgBonus,
    this.iceDmgBonus,
    this.windDmgBonus,
    this.physicalDmgBonus,
    this.imaginaryDmgBonus,
    this.quantumDmgBonus,
    this.lightningDmgBonus,
  );

  DamageBonuses copyWith(
          double? fireDmgBonus,
          double? iceDmgBonus,
          double? windDmgBonus,
          double? physicalDmgBonus,
          double? imaginaryDmgBonus,
          double? quantumDmgBonus,
          double? lightningDmgBonus) =>
      DamageBonuses(
        fireDmgBonus ?? this.fireDmgBonus,
        iceDmgBonus ?? this.iceDmgBonus,
        windDmgBonus ?? this.windDmgBonus,
        physicalDmgBonus ?? this.physicalDmgBonus,
        imaginaryDmgBonus ?? this.imaginaryDmgBonus,
        quantumDmgBonus ?? this.quantumDmgBonus,
        lightningDmgBonus ?? this.lightningDmgBonus,
      );
}
