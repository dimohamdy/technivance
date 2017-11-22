//
//  LeaguesModel.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import ObjectMapper

class LeaguesModel {
    private let disposeBag = DisposeBag()

    func getDataFromAPI(completionWithData: @escaping (_ result: [Competition])->(),completionWithError: @escaping (_ error: Error)->()){
        RxAlamofire.requestJSON(.get, "http://api.football-data.org/v1/competitions/")
            .debug()
            .subscribe(onNext: {  (r, json) in
                // Convert JSON String to Model
                let competitions:[Competition] = Mapper<Competition>().mapArray(JSONObject: json) ?? []
                completionWithData(competitions)
                }, onError: {  (error) in
                    completionWithError(error)
            })
            .disposed(by: disposeBag)
    }
    
}
