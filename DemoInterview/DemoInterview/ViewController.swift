//
//  ViewController.swift
//  DemoInterview
//
//  Created by ST-MacBookpro on 21/02/23.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        loadJson(fromURLString: "https://itunes.apple.com/search?term=adele") { (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    parse(jsonData: data)
                }
            case .failure(let error):
                print(error)
            }
            
            
        }
        func loadJson(fromURLString urlString: String,
                      completion: @escaping (Result<Data, Error>) -> Void) {
            if let url = URL(string: urlString) {
                let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    if let data = data {
                        completion(.success(data))
                    }
                }
                
                urlSession.resume()
            }
        }
        
        func parse(jsonData: Data) {
            do {
                let decodedData = try JSONDecoder().decode(ArtistModelClass.self,
                                                           from: jsonData)
                print(decodedData)
                for data in decodedData.results {
                    print(decodedData.results)
                    let view = ArtistTile()
                    view.setProperties(artworkUrl: data.artworkUrl60 ?? "", trackName: data.trackName ?? "", artistName: data.artistName ?? "", description: data.longDescription ?? "", collectionPrice: data.collectionPrice ?? 0)
                    mainStackView.addArrangedSubview(view)
                }
            } catch {
                print("decode error")
            }
        }
    }
}
