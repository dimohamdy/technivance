//
//  TeamsModelView.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import Foundation
import RxSwift

class TeamsModelView {
    var teamsModel:TeamsModel?
    var teams:Variable<[Team]>? = Variable([])
    var errorMessage:Variable<String>? = Variable("")
    
    init(teamsModel:TeamsModel) {
        self.teamsModel =  teamsModel
    }
    func getData(dataUrl:DataUrl)  {
       let id =  dataUrl.href?.slice(from: "competitions/", to: "/teams")
        
        self.teamsModel?.getDataFromAPI(url: dataUrl.href!,completionWithData: { [weak self] leaguesData in
            self?.teams?.value = leaguesData
            }, completionWithError: { [weak self] error in
                self?.teams?.value = []
                
        })
}
}
extension String {
    
    func slice(from: String, to: String) -> String? {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
