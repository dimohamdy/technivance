//
//  TeamViewController.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TeamViewController: UIViewController {

    private let teamModelView = TeamModelView(teamModel: TeamModel())
    private let playedMatchCellIdentifier = "PlayedMatchTableViewCell"
    private let matchCellIdentifier = "MatchTableViewCell"

    var team:Team? = nil

    private let disposeBag = DisposeBag()
    
    
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamMatchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        setupTableViewBinding()
        teamModelView.getData(dataUrl: (team?.links?.fixtures)!)
        
        teamNameLabel.text = team?.name

    }
    private func setupTableView() {
        
        //This is necessary since the UITableViewController automatically set his tableview delegate and dataSource to self
        teamMatchTableView.delegate = nil
        teamMatchTableView.dataSource = nil
        
        teamMatchTableView.tableFooterView = UIView() //Prevent empty rows
        //teamMatchTableView.register(PlayedMatchTableViewCell.self, forCellReuseIdentifier: playedMatchCellIdentifier)
        //teamMatchTableView.register(MatchTableViewCell.self, forCellReuseIdentifier: matchCellIdentifier)

    }
    
    private func setupTableViewBinding() {
        
        teamModelView.fixtures?.asObservable()
            .bind(to: teamMatchTableView.rx.items(cellIdentifier: playedMatchCellIdentifier, cellType: PlayedMatchTableViewCell.self)) {  row, fixture, cell in
                
                cell.config(fixture: fixture)
                
                
            }
            .disposed(by: disposeBag)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
