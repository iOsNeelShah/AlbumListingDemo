//
//  APIService.swift
//  AlbumDemoApp
//
//  Created by Neel on 11/27/24.
//
import Foundation

protocol APIServiceProtocol {
    func fetchAlbumList(completion: @escaping ([AlbumList]?) -> Void)
}
 
class APIService: APIServiceProtocol {
    
    let baseURL = URL(string: "https://jsonplaceholder.typicode.com/photos")
    
    func fetchAlbumList(completion: @escaping ([AlbumList]?) -> Void) {
        guard let url = baseURL else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("error in data fetching")
                return
            }
            
            do {
                let list = try JSONDecoder().decode([AlbumList].self, from: data)
                completion(list)
            }
            catch {
                completion(nil)
            }
        }.resume()
    }
}
