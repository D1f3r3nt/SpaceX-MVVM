import Foundation

final class MissionMapper {
    static func convertDto(missionDto: MissionDto) -> Mission {
        return Mission(
            patch: missionDto.links?.patch?.small,
            video: missionDto.links?.webcast,
            date: missionDto.staticFireDateUTC ?? "No data",
            rocketId: missionDto.rocket,
            succes: missionDto.success ?? false,
            failure: missionDto.failures?.count == 0 ? nil : missionDto.failures![0].reason,
            details: missionDto.details ?? "No data",
            name: missionDto.name ?? "Mission",
            flightNumber: missionDto.flightNumber ?? 0
        )
    }
    
    static func convertListDto(missionsDto: [MissionDto]) -> [Mission] {
        return missionsDto.map { mission in
            return convertDto(missionDto: mission)
        }
    }
}
