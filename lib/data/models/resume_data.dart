import 'package:json_annotation/json_annotation.dart';

part 'resume_data.g.dart';

@JsonSerializable()
class ResumeData {
  const ResumeData({
    required this.phone,
    required this.email,
    required this.address,
    required this.sex,
    required this.birthDate,
    required this.linkedIn,
  });

  final String phone;
  final String email;
  final String address;
  final String sex;
  final String birthDate;
  final HyperLink linkedIn;

  factory ResumeData.fromJson(Map<String, dynamic> json) =>
      _$ResumeDataFromJson(json);
}

@JsonSerializable()
class HyperLink {
  HyperLink(this.title, this.url);

  factory HyperLink.fromJson(Map<String, dynamic> json) =>
      _$HyperLinkFromJson(json);
  final String title;
  final String url;
}
