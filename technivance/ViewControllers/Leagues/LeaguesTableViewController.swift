//
//  LeaguesTableViewController.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class LeaguesTableViewController: UITableViewController {

    
    private let leaguesModelView = LeaguesModelView(leaguesModel: LeaguesModel())
    private let cellIdentifier = "LeagueTableViewCell"
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        setupTableView()
        setupTableViewBinding()
        setupTableSelected()
        leaguesModelView.getData()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    private func setupTableView() {
        
        //This is necessary since the UITableViewController automatically set his tableview delegate and dataSource to self
        tableView.delegate = nil
        tableView.dataSource = nil
        
        tableView.tableFooterView = UIView() //Prevent empty rows
        //tableView.register(LeagueTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupTableViewBinding() {
        
        leaguesModelView.leagues?.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier, cellType: LeagueTableViewCell.self)) {  row, competition, cell in
                
                cell.config(competition: competition)

                
            }
            .disposed(by: disposeBag)
        
        
    }
    
    private func setupTableSelected(){
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let competition:Competition = self!.leaguesModelView.leagues!.value[indexPath.row]
                self?.performSegue(withIdentifier: "show_teams", sender: competition)
            }).disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let teamsViewController:TeamsViewController = segue.destination as! TeamsViewController
        teamsViewController.competition =  sender as? Competition
    }
    
    
}
