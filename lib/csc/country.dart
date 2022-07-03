class Country {
  final int id;
  final String name;

  const Country({
    required this.id,
    required this.name,
  });

  factory Country.fromJSON(Map<String, dynamic> json) {
    return Country(
      id: json["id"],
      name: json["name"],
    );
  }
}
