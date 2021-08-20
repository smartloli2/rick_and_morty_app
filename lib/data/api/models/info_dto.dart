import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/info.dart';

part 'info_dto.g.dart';

@JsonSerializable()
class InfoDto extends Equatable {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const InfoDto({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory InfoDto.fromJson(Map<String, dynamic> json) =>
      _$InfoDtoFromJson(json);

  factory InfoDto.fromDomain(Info info) => InfoDto(
        count: info.count,
        pages: info.pages,
        next: info.next,
        prev: info.prev,
      );

  Map<String, dynamic> toJson() => _$InfoDtoToJson(this);

  Info toDomain() => Info(
        count: count,
        pages: pages,
        next: next,
        prev: prev,
      );

  @override
  List<Object?> get props => [count, pages, next, prev];
}
