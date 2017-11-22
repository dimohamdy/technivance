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
        
        self.teamsModel?.getDataFromAPI(url: dataUrl.href!,completionWithData: { [weak self] leaguesData in
            self?.teams?.value = leaguesData
            }, completionWithError: { [weak self] error in
                self?.teams?.value = []
                
        })
}
}
