//
//  PersonViewController.swift
//  MVPTest(HW)
//
//  Created by Леся Акимова on 16.01.2022.
//

import UIKit

class PersonViewController: UIViewController, PresenterInput, PersonViewDelegate {
    
    var output: PresenterOutput!
    let personView = PersonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = personView
        personView.delegate = self
    }
    
    func showPersonImage(_ image: Data) {
        personView.personImage.image = UIImage(data: image)
    }
    
    func showPersonName(_ name: String) {
        personView.personName.text = name
    }
    
    func actionDidPressed() {
        output?.getPerson()
    }
}
