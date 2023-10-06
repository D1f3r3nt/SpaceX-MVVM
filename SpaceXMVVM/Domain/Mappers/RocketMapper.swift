import Foundation

final class RocketMapper {
    static func convertDto(rocketDto: RocketDto) -> Rocket {
        
        let engineFormatted: String = (rocketDto.engines?.type ?? "Engine").uppercased()
        + " " + (rocketDto.engines?.version ?? "").uppercased()
        
        return Rocket(
            height: rocketDto.height?.meters ?? 0.0,
            mass: rocketDto.mass?.kg ?? 0,
            engine: engineFormatted,
            image: rocketDto.flickrImages?[0],
            name: rocketDto.name ?? "No data",
            active: rocketDto.active ?? false,
            description: rocketDto.description ?? "No data",
            wikipedia: rocketDto.wikipedia
        )
    }
}
