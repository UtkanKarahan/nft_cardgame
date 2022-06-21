
class Pack {

  String description;
  int id = 0;
  String owner = "USER1";
  String pic = "https://m.media-amazon.com/images/I/91ZpZEO2t5L._SL1500_.jpg";
  List<dynamic> contains = [];


  Pack({
    required this.description,
  });

}

Pack demoPack = Pack( description: "Test Pack Card Demo", );