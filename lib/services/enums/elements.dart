enum Elements {
  fire,
  ice,
  imaginary,
  lightning,
  none,
  physical,
  quantum,
  wind;

  @override
  String toString() {
    switch (this) {
      case Elements.fire:
        return 'fire';
      case Elements.ice:
        return 'ice';
      case Elements.imaginary:
        return 'imaginary';
      case Elements.lightning:
        return 'lightning';
      case Elements.none:
        return 'none';
      case Elements.physical:
        return 'physical';
      case Elements.quantum:
        return 'quantum';
      case Elements.wind:
        return 'wind';
    }
  }
}

extension StringUtils on Elements {
  Elements? fromString(String data) {
    switch (data) {
      case 'fire':
        return Elements.fire;
      case 'ice':
        return Elements.ice;
      case 'imaginary':
        return Elements.imaginary;
      case 'lightning':
        return Elements.lightning;
      case 'none':
        return Elements.none;
      case 'physical':
        return Elements.physical;
      case 'quantum':
        return Elements.quantum;
      case 'wind':
        return Elements.wind;
      default:
        return null;
    }
  }
}
