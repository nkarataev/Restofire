//
//  HTTPBinArrayParametersService+POST.swift
//  Restofire
//
//  Created by Rahul Katariya on 29/09/16.
//  Copyright © 2016 AarKay. All rights reserved.
//

import Restofire
import Alamofire

struct HTTPBinArrayParametersPOSTService: Requestable, HTTPBinConfigurable {

    typealias Model = [String: Any]
    let path: String = "post"
    let method: HTTPMethod = .post
    let parameters: Any?
    
    init(parameters: Any) {
        self.parameters = parameters
    }
    
}
