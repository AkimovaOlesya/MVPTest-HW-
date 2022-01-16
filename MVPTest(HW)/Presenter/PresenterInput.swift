//
//  PresenterInput.swift
//  MVPTest(HW)
//
//  Created by Леся Акимова on 16.01.2022.
//

import Foundation

protocol PresenterInput: AnyObject {
    
    func showPersonImage(_ image: Data)
    func showPersonName(_ name: String)
}
