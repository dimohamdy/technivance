//
//  LeaguesModelView.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import Foundation
import RxSwift

class LeaguesModelView {
    var leaguesModel:LeaguesModel?
    var leagues:Variable<[Competition]>? = Variable([])
    var errorMessage:Variable<String>? = Variable("")

    init(leaguesModel:LeaguesModel) {
        self.leaguesModel =  leaguesModel
    }
    func getData()  {

        self.leaguesModel?.getDataFromAPI(completionWithData: { [weak self] leaguesData in
            self?.leagues?.value = leaguesData
                }, completionWithError: { [weak self] error in
                    self?.leagues?.value = []
                    
            })
}
}
