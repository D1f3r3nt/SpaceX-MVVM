import Foundation

final class SpaceXCall {
    private let session = URLSession.shared
    
    private var baseComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spacexdata.com"
        return components
    }
    
    // MARK: - Get Missions
    func getMissions(
        completion: @escaping (Result<[Mission], NetworkError>) -> Void
    ) {
        
        var component = baseComponents
        component.path = "/v4/launches"
        
        guard let url = component.url else {
            completion(.failure(.malFormedUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.unknown))
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            let urlResponse = (response as? HTTPURLResponse)
            let statusCode = urlResponse?.statusCode
            
            guard statusCode == 200 else {
                completion(.failure(.statusCode(code: statusCode)))
                return
            }
            
            guard let resource = try? JSONDecoder().decode([MissionDto].self, from: data) else {
                completion(.failure(.decodingFailed))
                return
            }
            
            let historyMissionsDto = resource.filter { mission in
                guard let near = mission.upcoming else {
                    return false
                }
                return !near
            }
            
            let missions = MissionMapper.convertListDto(missionsDto: historyMissionsDto.reversed())
            
            completion(.success(missions))
        }
        
        task.resume()
    }
}

extension SpaceXCall {
    enum NetworkError: Error {
        case unknown
        case malFormedUrl
        case decodingFailed
        case encodingFailed
        case noData
        case statusCode(code: Int?)
    }
}
