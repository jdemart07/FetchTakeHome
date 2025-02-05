//
//  MockURL.swift
//  FetchTakeHome
//
//  Created by camillo.de.martinis on 2/4/25.
//

import Foundation

import Foundation

// Custom URLProtocol for mocking network requests
class MockURL: URLProtocol {
    static var requestHandler: ((URLRequest) -> (Data?, URLResponse?, Error?))?
    static var simulatedError: Error?

    override class func canInit(with request: URLRequest) -> Bool {
        return true  // We want to intercept all requests in this test
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request  // Returning the same request as canonical
    }

    override func startLoading() {
        guard let handler = MockURL.requestHandler else {
            fatalError("Request handler not set for MockURLProtocol")
        }
        
        if let error = MockURL.simulatedError {
            self.client?.urlProtocol(self, didFailWithError: error)
        } else {
            // Use the handler to generate a response
            let (data, response, error) = handler(request)
            
            // Simulate the response
            if let data = data {
                self.client?.urlProtocol(self, didLoad: data)
            }
            if let response = response {
                self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            if let error = error {
                self.client?.urlProtocol(self, didFailWithError: error)
            }
            self.client?.urlProtocolDidFinishLoading(self)
        }
    }
    override func stopLoading() {
        // No-op
    }
}
