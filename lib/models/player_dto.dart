import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_dto.freezed.dart';
part 'player_dto.g.dart';

@freezed
class PlayerDto with _$PlayerDto {
  const factory PlayerDto({
    required String id,
    required String name,
  }) = _PlayerDto;

  factory PlayerDto.fromJson(Map<String, Object?> json) => _$PlayerDtoFromJson(json);
  factory PlayerDto.fixture() => const PlayerDto(id: 'player_id', name: 'Player Name');
}
