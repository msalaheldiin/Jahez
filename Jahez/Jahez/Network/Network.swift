//
//  Network.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import Foundation

class NetworkManager {
    
    static let shared =  NetworkManager.init()
    private init() {}

    func fetchData<T>(withUrlRequest urlRequest: URL?) async -> Result<T,Error> where T : Decodable{
            guard let url = urlRequest else {return .failure(MyError.failedToGetUsers)}
            do {
                let session = URLSession.shared
                let (data, _) = try await session.data(from: url)
                let result = try JSONDecoder().decode(T.self,from: data )
                return .success(result)
            }
            catch {
                return.failure(error)
            }
        }}

enum MyError: Error {
    case failedToGetUsers
}
 
