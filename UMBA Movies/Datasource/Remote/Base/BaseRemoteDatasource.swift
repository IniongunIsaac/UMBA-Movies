//
//  BaseRemoteDatasource.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

class BaseRemoteDatasource {
    
    func makeAPIRequest<T>(path: RemotePath, responseType: T.Type) -> Observable<T> where T : Decodable, T : Encodable {
        
        _print("Request URL: \(path.requestURL)", .success)
        
        let manager = Session.default
        
        return manager.rx.request(.get, path.requestURL, parameters: ["api_key": Bundle.main.apiKey], encoding: URLEncoding.default)
            .validate(statusCode: 200 ..< 499)
            .debug()
            .responseString()
            .flatMap { (_, responseString) -> Observable<T> in

                do {
                    _print(responseString)
                    
                    let requestResponse = try responseType.mapFrom(jsonString: responseString)!
                    return Observable.just(requestResponse)

                } catch let error {
                    _print(error)
                    throw error
                }
        }
        .observeOn(MainScheduler.instance)
        
    }
    
}
