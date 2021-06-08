//
//  MainViewInput.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import Foundation

protocol MainViewInput: AnyObject {
    func setupInitialState()
    func didRecived(_ pryanikObjects: [PryanikObject])
}
