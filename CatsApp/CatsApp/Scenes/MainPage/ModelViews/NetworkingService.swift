//
//  NetworkingService.swift
//  CatsApp
//
//  Created by Default on 03.05.24.
//

import Foundation

class NetworkingService {
    
    // MARK: - Properties
    
    private var cat: CatModel?
    private var length: Int?
    
    // MARK: - Networking
    
    func fetchData(completion: @escaping () -> Void) {
        guard let length = length else {
            return
        }
        
        let url = URL(string: "https://catfact.ninja/fact?max_length=\(length)")!
        URLSession.shared.fetchData(at: url) { [weak self] result in
            switch result {
            case .success(let cat):
                self?.cat = cat
                completion()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getFact() -> String? {
        return cat?.fact
    }
    
    func setLength(_ length: Int) {
        self.length = length
    }
}

extension URLSession {
    func fetchData(at url: URL, completion: @escaping (Result<CatModel, Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let cat = try JSONDecoder().decode(CatModel.self, from: data)
                    completion(.success(cat))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

