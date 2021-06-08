//
//  MainPresenter.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import Foundation
import PromiseKit

class MainPresenter: MainViewOutput {
    private weak var view: MainViewInput!
    private var networkService: NetworkService!
    
    init(view: MainViewInput) {
        self.view = view
        networkService = NetworkServiceImp.shared
    }
    
    func viewIsReady() {
        view.setupInitialState()
        loadObjects()
    }
    
    private func loadObjects() {
        firstly {
            networkService.getObjects()
        } .done { [weak self] objects in
            self?.view.didRecived(objects)
        } .catch { error in
            print(error)
        }
    }
}
