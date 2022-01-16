//
//  PersonModuleAssembly.swift
//  MVPTest(HW)
//
//  Created by Леся Акимова on 16.01.2022.
//


import UIKit

class PersonModuleAssembly {
    
    class func configureModule() -> UIViewController {
        let view = PersonViewController()
        let networkManager = NetworkManagerImplementation()
        let presenter = Presenter()
        
        view.output = presenter
        presenter.view = view
        presenter.networkManager = networkManager
        
        return view
    }
}
