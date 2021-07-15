//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Abdul Dayur on 7/14/21.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion: @escaping ([Follower]?, String?) -> Void) {
        
        let endpoint = baseURL + "\(username)/followers?per_page=10&page=\(page)"
        
        guard let url = URL(string: endpoint) else{
            completion(nil, "Username created invalid request!")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(nil, "Invalid response from the server!")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "The data from server was invalid")
                return
            }
            
            guard let data = data else {
                completion(nil, "The data from server was invalid")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(followers, nil)
                
            } catch {
                completion(nil, "The data from server was invalid")
            }
            
        }
        task.resume()
        
    }
}
