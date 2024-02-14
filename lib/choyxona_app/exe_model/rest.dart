class Restnt {
  String? img;
  String? name;
  num? rating;
  String? location;
  String? desc;
  String? managerNum;
  String? restNum;

  Restnt({
    required this.img,
    required this.name,
    required this.rating,
    required this.location,
    required this.desc,
    required this.managerNum,
    required this.restNum,
  });
}

final restntList = [
  Restnt(
    img: "assets/exe_restuarnt/img.png",
    name: "Rose Garden Restaurant",
    rating: 4.7,
    location:
        "O'zbekiston ko'chasi   torvuz olin daxasi 10-uy",
    desc:
        "O'zbekiston ko'chasi xandalakchilar ko'chasi torvuz olin daxasi 10-uyO'zbekiston ko'chasi xandalakchilar ko'chasi torvuz olin daxasi 10-uyO'zbekiston ko'chasi xandalakchilar ko'chasi torvuz olin daxasi 10-uy",
    managerNum: "99 999 99 99",
    restNum: "99 999 99 99",
  ),
  Restnt(
    img: "assets/exe_restuarnt/img.png",
    name: "Rose Garden Restaurant",
    rating: 4.3,
    location:
        "O'zbekiston ko'chasi   torvuz olin daxasi 10-uy",
    desc:
        "O'zbekiston ko'chasi xandalakchilar ko'chasi torvuz olin daxasi 10-uyO'zbekiston ko'chasi xandalakchilar ko'chasi torvuz olin daxasi 10-uyO'zbekiston ko'chasi xandalakchilar ko'chasi torvuz olin daxasi 10-uy",
    managerNum: "77 777 77 77",
    restNum: "77 777 77 77",
  ),
  Restnt(
    img: "assets/exe_restuarnt/img.png",
    name: "Rose Garden Restaurant",
    rating: 3.9,
    location:
        "O'zbekiston ko'chasi   torvuz olin daxasi 10-uy",
    desc:
        "O'zbekiston ko'chasi xandalakchilar ko'chasi torvuz olin daxasi 10-uyO'zbekiston ko'chasi xandalakchilar ko'chasi torvuz olin daxasi 10-uyO'zbekiston ko'chasi xandalakchilar ko'chasi torvuz olin daxasi 10-uy",
    managerNum: "88 888 88 88",
    restNum: "88 888 88 88",
  ),

];
