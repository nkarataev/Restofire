//
//  ParameterEncodingSpec.swift
//  Restofire
//
//  Created by Rahul Katariya on 29/09/16.
//  Copyright © 2016 AarKay. All rights reserved.
//

import Quick
import Nimble
@testable import Restofire

class HTTPBinArrayParametersPOSTServiceSpec: ServiceSpec {

    override func spec() {
        
        describe("HTTPBinArrayParametersPOSTService") {
            
            it("executeTask") {
                
                let actual: [String] = ["Rahul Katariya", "Aar Kay"]
                var expected: [String]!
             
                HTTPBinArrayParametersPOSTService(parameters: ["Rahul Katariya", "Aar Kay"]).executeTask() {
                    if let response = $0.result.value, let value = response["json"] as? [String] {
                        expected = value
                    }
                }
                
                expect(expected).toEventually(equal(actual), timeout: self.timeout, pollInterval: self.pollInterval)
                
            }
            
            it("executeRequestOperation") {
                
                let actual: [String] = ["Rahul Katariya", "Aar Kay"]
                var expected: [String]!
                
                let requestOperation = HTTPBinArrayParametersPOSTService(parameters: ["Rahul Katariya", "Aar Kay"]).executeTask() {
                    if let response = $0.result.value, let value = response["json"] as? [String] {
                        expected = value
                    }
                }
                
                requestOperation.start()
                
                expect(expected).toEventually(equal(actual), timeout: self.timeout, pollInterval: self.pollInterval)
                
            }
            
        }
        
    }
}
