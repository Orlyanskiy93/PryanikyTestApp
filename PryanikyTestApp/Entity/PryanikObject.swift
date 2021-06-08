//
//  PryanikObject.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import UIKit
import ObjectMapper

struct PryanikObject: ImmutableMappable {
    var name: String
    var text: String
    var imageUrlString: String?
    var id: Int?
    
    init(map: Map) throws {
        name = try map.value("name")
        id = try? map.value("data.selectedId")
        if let id = id {            
            text = try map.value("data.variants.\(id - 1).text")
        } else {
            text = try map.value("data.text")
            imageUrlString = try? map.value("data.url")
        }
    }
}
