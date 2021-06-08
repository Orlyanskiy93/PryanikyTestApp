//
//  NetworkService.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import PromiseKit

protocol NetworkService {
    func getObjects() -> Promise<[PryanikObject]>
}
