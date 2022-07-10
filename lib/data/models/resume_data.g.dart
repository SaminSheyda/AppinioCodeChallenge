// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResumeData _$ResumeDataFromJson(Map<String, dynamic> json) => ResumeData(
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      sex: json['sex'] as String,
      birthDate: json['birthDate'] as String,
      linkedIn: HyperLink.fromJson(json['linkedIn'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResumeDataToJson(ResumeData instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'sex': instance.sex,
      'birthDate': instance.birthDate,
      'linkedIn': instance.linkedIn,
    };

HyperLink _$HyperLinkFromJson(Map<String, dynamic> json) => HyperLink(
      json['title'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$HyperLinkToJson(HyperLink instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
    };
