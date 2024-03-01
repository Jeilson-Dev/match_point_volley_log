import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:match_point_volley_log/models/dto.dart';

part 'team_dto.freezed.dart';
part 'team_dto.g.dart';

@freezed
class TeamDto with _$TeamDto {
  const factory TeamDto({
    required String id,
    required List<PlayerDto> team,
  }) = _TeamDto;

  factory TeamDto.fromJson(Map<String, Object?> json) => _$TeamDtoFromJson(json);
}
