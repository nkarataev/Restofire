//
//  Configuration.swift
//  Restofire
//
//  Created by Rahul Katariya on 24/03/16.
//  Copyright © 2016 AarKay. All rights reserved.
//

import enum Alamofire.Method
import enum Alamofire.ParameterEncoding

public class Configuration {
    
    public static let defaultConfiguration = Configuration()
    
    public var baseURL: String!
    public var method: Alamofire.Method = .GET
    public var encoding: Alamofire.ParameterEncoding = .JSON
    public var headers: [String : String]?
    public var rootKey: String? = nil
    public var logging: Bool = false
    
}