class GuideInfo {
  final String message;
  final String imgUrl;

  GuideInfo({this.message, this.imgUrl});

  GuideInfo.fromJson(Map<String, dynamic> json)
      : message = json['text'],
        imgUrl = json['image'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.message;
    data['image'] = this.imgUrl;
    return data;
  }
}
