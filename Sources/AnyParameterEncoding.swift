//
//  AnyParameterEncoding.swift
//  Restofire
//
//  Created by Rahul Katariya on 30/09/16.
//  Copyright © 2016 AarKay. All rights reserved.
//

import Alamofire

public protocol AnyParameterEncoding: ParameterEncoding {
    
    /// Creates a URL request by encoding parameters and applying them onto an existing request.
    ///
    /// - parameter urlRequest: The request to have parameters applied.
    /// - parameter parameters: The parameters to apply.
    ///
    /// - throws: An `AFError.parameterEncodingFailed` error if encoding fails.
    ///
    /// - returns: The encoded request.
    func encode(_ urlRequest: URLRequestConvertible, withAny parameters: Any) throws -> URLRequest
    
}

extension JSONEncoding: AnyParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, withAny parameters: Any) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: options)
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
            urlRequest.httpBody = data
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        return urlRequest
    }
    
}

extension PropertyListEncoding: AnyParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, withAny parameters: Any) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        do {
            let data = try PropertyListSerialization.data(
                fromPropertyList: parameters,
                format: format,
                options: options
            )
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/x-plist", forHTTPHeaderField: "Content-Type")
            }
            
            urlRequest.httpBody = data
        } catch {
            throw AFError.parameterEncodingFailed(reason: .propertyListEncodingFailed(error: error))
        }
        return urlRequest
    }
    
}
