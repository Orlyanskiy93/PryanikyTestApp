//
//  DetailsPresenter.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import Foundation
import Kingfisher

class DetailsPresenter: DetailsViewOutput {
    weak var view: DetailsViewInput!
    
    init(view: DetailsViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
}
