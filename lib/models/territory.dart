class Territory {
  //items in each territory
  final String terrName;
  final int terrNum;
  final String mapImgPath;
  final String pdfPath;
  final String notesPath;

  //constructor
  Territory({required this.terrName, required this.terrNum, required this.mapImgPath, required this.pdfPath, required this.notesPath});

  Map<String, dynamic> toJson() => {
        'terrName': terrName,
        'terrNum': terrNum,
        'mapImgPath': mapImgPath,
        'pdfPath': pdfPath,
        'notesPath': notesPath,
      };

  String get name => terrName;

  int get number => terrNum;

  String get image => mapImgPath;

  String get pdf => pdfPath;
}
