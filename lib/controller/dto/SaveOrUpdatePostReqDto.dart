class SaveOrUpdatePostReqDto {

  final String? title;
  final String? content;

  SaveOrUpdatePostReqDto(this.title, this.content);

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
  };

}