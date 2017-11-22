//
//  TeamModel.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import ObjectMapper

class TeamModel {
    private let disposeBag = DisposeBag()
    
    func getDataFromAPI(url:String,completionWithData: @escaping (_ result: [Fixture])->(),completionWithError: @escaping (_ error: Error)->()){
        RxAlamofire.requestJSON(.get, url)
            .debug()
            .subscribe(onNext: {  (r, json) in
                // Convert JSON String to Model
                let teamMatchsResult:TeamMatchsResult = Mapper<TeamMatchsResult>().map(JSONObject: json)!
                completionWithData(teamMatchsResult.fixtures ?? [])
            }, onError: {  (error) in
                completionWithError(error)
            })
            .disposed(by: disposeBag)
    }
    
}
