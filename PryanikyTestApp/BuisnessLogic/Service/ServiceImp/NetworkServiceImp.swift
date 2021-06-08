//
//  NetworkServiceImp.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import Foundation
import Alamofire
import ObjectMapper
import PromiseKit

class NetworkServiceImp: NetworkService {
    static let shared = NetworkServiceImp()
    
    private init() {}
    
    func getObjects() -> Promise<[PryanikObject]> {
        let url = URL(string: "https://pryaniky.com/static/json/sample.json")!
        
        return Promise { seal in
            AF.request(url).validate().responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        guard let dict = data as? [String: Any],
                              let array = dict["data"] as? [Any],
                              let sringArray = dict["view"] as? [String] else {
                            return
                        }
                        let objects = try Mapper<PryanikObject>().mapArray(JSONObject: array)
                        var pryanikObjects = [PryanikObject]()
                        sringArray.forEach { string in
                            if let pryanikObject = objects.first(where: { pryanikObject in
                                return pryanikObject.name == string
                            }) {
                                pryanikObjects.append(pryanikObject)
                            }
                        }
                        seal.fulfill(pryanikObjects)
                    } catch {
                        seal.reject(error)
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}
