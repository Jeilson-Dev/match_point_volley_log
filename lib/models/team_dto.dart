import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:match_point_volley_log/models/dto.dart';
import 'package:equatable/equatable.dart';

part 'team_dto.freezed.dart';

@freezed
class TeamDto extends Equatable with _$TeamDto {
  const TeamDto._();
  const factory TeamDto({
    required String id,
    required String name,
    required bool isPlayerOne,
    required int score,
    required List<PlayerDto> team,
  }) = _TeamDto;
  @override
  List<Object?> get props => [id, name, isPlayerOne, team];

  factory TeamDto.fixture() => TeamDto(id: 'team_id', name: 'team_name', score: 0, team: [PlayerDto.fixture()], isPlayerOne: false);
}
