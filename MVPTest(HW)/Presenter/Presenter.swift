//
//  Presenter.swift
//  MVPTest(HW)
//
//  Created by Леся Акимова on 16.01.2022.
//

import Foundation

class Presenter: PresenterOutput {
    
    var networkManager: NetworkManager!
    var view: PresenterInput!
    
    func getPerson() {
        networkManager?.fetchData(from: "https://www.breakingbadapi.com/api/characters") { array in
            let randomPerson = array.randomElement()
            DispatchQueue.global().async {
                guard let imageUrl = URL(string: randomPerson!.img) else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                DispatchQueue.main.async {
                    self.view.showPersonImage(imageData)
                    self.view.showPersonName(randomPerson!.nickname)
                }
            }
        }
    }
}
