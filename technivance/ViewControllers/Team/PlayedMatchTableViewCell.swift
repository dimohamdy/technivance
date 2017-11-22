//
//  PlayedMatchTableViewCell.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit

class PlayedMatchTableViewCell: UITableViewCell {

    @IBOutlet weak var dateOfMatchLable: UILabel!
    @IBOutlet weak var homePlayerImageView: UIImageView!
    @IBOutlet weak var awayPlayerImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(fixture:Fixture) {
        self.dateOfMatchLable.text = fixture.date
        self.resultLabel.text = fixture.result?.goalsHomeTeam as? String ?? ""

        let homeUrl = URL(string: "")
        let image = UIImage(named: "default_profile_icon")
        homePlayerImageView?.kf.setImage(with: homeUrl, placeholder: image)
        homePlayerImageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        homePlayerImageView?.kf.indicatorType = .activity

        let awayUrl = URL(string: "")
        awayPlayerImageView?.kf.setImage(with: awayUrl, placeholder: image)
        awayPlayerImageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        awayPlayerImageView?.kf.indicatorType = .activity
        self.layoutIfNeeded() //update immediately
        
    }
}
