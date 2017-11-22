//
//  TeamModelView.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import Foundation
import RxSwift

class TeamModelView {
    var teamModel:TeamModel?
    var fixtures:Variable<[Fixture]>? = Variable([])
    var errorMessage:Variable<String>? = Variable("")
    
    init(teamModel:TeamModel) {
        self.teamModel =  teamModel
    }
    func getData(dataUrl:DataUrl)  {
        
        self.teamModel?.getDataFromAPI(url: dataUrl.href!,completionWithData: { [weak self] leaguesData in
            self?.fixtures?.value = leaguesData
            }, completionWithError: { [weak self] error in
                self?.fixtures?.value = []
                
        })
    }
}
