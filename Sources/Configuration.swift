//
//  Configuration.swift
//  Restofire
//
//  Created by Rahul Katariya on 24/03/16.
//  Copyright © 2016 AarKay. All rights reserved.
//

import Foundation
import Alamofire

/// A Configuration of RESTful Services. You must provide a `baseURL`.
///
/// ```swift
/// var configuration = Configuration()
/// configuration.baseURL = "http://www.mocky.io/v2/"
/// configuration.headers = ["Content-Type": "application/json"]
/// configuration.authentication.credential = URLCredential(user: "user", password: "password", persistence: .forSession)
/// configuration.validation.acceptableStatusCodes = Array(200..<300)
/// configuration.validation.acceptableContentTypes = ["application/json"]
/// configuration.logging = true
/// configuration.retry.retryErrorCodes = [.timedOut,.networkConnectionLost]
/// configuration.retry.retryInterval = 20
/// configuration.retry.maxRetryAttempts = 10
/// let sessionConfiguration = URLSessionConfiguration.default
/// sessionConfiguration.timeoutIntervalForRequest = 7
/// sessionConfiguration.timeoutIntervalForResource = 7
/// sessionConfiguration.HTTPAdditionalHeaders = Manager.defaultHTTPHeaders
/// configuration.manager = Alamofire.SessionManager(configuration: sessionConfiguration)
/// ```
public struct Configuration {
    
    /// The base URL. `nil` by default.
    public var baseURL: String!
    
    /// The HTTP Method. `.GET` by default.
    public var method: Alamofire.HTTPMethod = .get
    
    /// The request parameter encoding. `.JSON` by default.
    public var encoding: Alamofire.ParameterEncoding = JSONEncoding.default
    
    /// The HTTP headers. `nil` by default.
    public var headers: [String : String] = [:]

    /// The `Authentication`.
    public var authentication = Authentication()
    
    /// The `Validation`.
    public var validation = Validation()
    
    /// The `Retry`.
    public var retry = Retry()
    
    /// The `Alamofire.DataResponseSerializer`.
    public var dataResponseSerializer: Alamofire.DataResponseSerializer<Any> = Alamofire.DataRequest.jsonResponseSerializer()
    
    /// The Alamofire Session Manager. `Alamofire.SessionManager.default` by default.
    public var sessionManager = Alamofire.SessionManager.default
    
    /// The queue on which reponse will be delivered. `DispatchQueue.main`
    /// by default.
    public var queue: DispatchQueue = DispatchQueue.main
    
    /// `Configuration` Intializer
    ///
    /// - returns: new `Configuration` object
    public init() {}
}
