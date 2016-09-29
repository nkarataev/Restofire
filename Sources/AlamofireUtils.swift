//
//  AlamofireRequest.swift
//  Restofire
//
//  Created by Rahul Katariya on 19/04/16.
//  Copyright © 2016 AarKay. All rights reserved.
//

import Alamofire

class AlamofireUtils {
    
    static func alamofireDataRequestFromRequestable<R: Requestable>(_ requestable: R) -> Alamofire.DataRequest {
        
        var request = requestable.sessionManager.request(requestable.baseURL + requestable.path, method: requestable.method, parameters: requestable.parameters as? [String: Any], encoding: requestable.encoding, headers: requestable.headers + requestable.configuration.headers)
    
        authenticateRequest(request, usingCredential: requestable.credential)
        validateRequest(request, forAcceptableContentTypes: requestable.acceptableContentTypes)
        validateRequest(request, forAcceptableStatusCodes: requestable.acceptableStatusCodes)
        validateRequest(request, forValidation: requestable.validationBlock)
        
        if let parameters = requestable.parameters, let encoding = requestable.encoding as? AnyParameterEncoding {
            do {
                let encodedURLRequest = try encoding.encode(request.request!, withAny: parameters)
                request = Alamofire.request(encodedURLRequest)
            } catch {
                fatalError("[Restofire] - Error while trying to encode AnyParameterEncoding")
            }
        }
        
        return request
        
    }
    
    fileprivate static func authenticateRequest(_ request: Alamofire.DataRequest, usingCredential credential:URLCredential?) {
        guard let credential = credential else { return }
        request.authenticate(usingCredential: credential)
    }
    
    fileprivate static func validateRequest(_ request: Alamofire.DataRequest, forAcceptableContentTypes contentTypes:[String]?) {
        guard let contentTypes = contentTypes else { return }
        request.validate(contentType: contentTypes)
    }
    
    fileprivate static func validateRequest(_ request: Alamofire.DataRequest, forAcceptableStatusCodes statusCodes:[Int]?) {
        guard let statusCodes = statusCodes else { return }
        request.validate(statusCode: statusCodes)

    }
    
    fileprivate static func validateRequest(_ request: Alamofire.DataRequest, forValidation validation:Alamofire.DataRequest.Validation?) {
        guard let validation = validation else { return }
        request.validate(validation)
    }
    
}
