//
//  LeagueTableViewCell.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import Kingfisher

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueLogoImageView: UIImageView!
    @IBOutlet weak var numberOfTeamsLabel: UILabel!
    @IBOutlet weak var numberOfGamesLabel: UILabel!
    @IBOutlet weak var leagueNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(competition:Competition)  {

        numberOfTeamsLabel.text = String(describing: competition.numberOfTeams!)
        numberOfGamesLabel.text = String(describing: competition.numberOfGames!)
        leagueNameLabel.text = competition.league!
        /*let url = URL(string: "")
        let image = UIImage(named: "player")
        leagueLogoImageView?.kf.setImage(with: url, placeholder: image)
        leagueLogoImageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        leagueLogoImageView?.kf.indicatorType = .activity
//        self.layoutIfNeeded() //update immediately
 */

    }
}
