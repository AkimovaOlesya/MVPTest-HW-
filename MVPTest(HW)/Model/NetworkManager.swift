//
//  NetworkManager.swift
//  MVPTest(HW)
//
//  Created by Леся Акимова on 16.01.2022.
//

import Foundation

protocol NetworkManager {
    
    func fetchData(from url: String, complition: @escaping ([Person]) -> Void)
}

class NetworkManagerImplementation: NetworkManager {
    
    func fetchData(from url: String, complition: @escaping ([Person]) -> Void) {
        guard let url = URL(string: url) else { return }
        var array = [Person]()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decode = try decoder.decode([Person].self, from: data)
                DispatchQueue.main.async {
                    array.append(contentsOf: decode)
                    complition(array)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
