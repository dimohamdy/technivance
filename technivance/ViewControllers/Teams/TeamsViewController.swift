//
//  TeamsViewController.swift
//  technivance
//
//  Created by BinaryBoy on 11/22/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TeamsViewController: UIViewController {

    private let cellIdentifier = "TeamsTableViewCell"
    private let teamsModelView = TeamsModelView(teamsModel: TeamsModel())
    private let disposeBag = DisposeBag()

    
    @IBOutlet weak var teamsTableView: UITableView!
    
    @IBOutlet weak var leagueLogoImageView: UIImageView!
    @IBOutlet weak var numberOfTeamsLabel: UILabel!
    @IBOutlet weak var numberOfGamesLabel: UILabel!
    @IBOutlet weak var leagueNameLabel: UILabel!
    
    var competition:Competition? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        setupTableViewBinding()
        setupTableSelected()
        
        numberOfTeamsLabel.text = String(describing: competition!.numberOfTeams!)
        numberOfGamesLabel.text = String(describing: competition!.numberOfGames!)
        leagueNameLabel.text = competition?.league!
        /*let url = URL(string: "")
         let image = UIImage(named: "player")
         leagueLogoImageView?.kf.setImage(with: url, placeholder: image)
         leagueLogoImageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
         leagueLogoImageView?.kf.indicatorType = .activity
         //        self.layoutIfNeeded() //update immediately
         */
        
        
        teamsModelView.getData(dataUrl: (competition?.links?.teams)!)
        
    }
    private func setupTableView() {
        
        //This is necessary since the UITableViewController automatically set his tableview delegate and dataSource to self
        teamsTableView.delegate = nil
        teamsTableView.dataSource = nil
        
        teamsTableView.tableFooterView = UIView() //Prevent empty rows
        teamsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupTableViewBinding() {
        
        teamsModelView.teams?.asObservable()
            .bind(to: teamsTableView.rx.items(cellIdentifier: cellIdentifier, cellType: UITableViewCell.self)) {  row, team, cell in
                
                cell.textLabel?.text = team.name
                
                let url = URL(string: team.crestUrl ?? "")
                let image = UIImage(named: "player")
                cell.imageView?.kf.setImage(with: url, placeholder: image)
                cell.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                cell.imageView?.kf.indicatorType = .activity
                cell.layoutIfNeeded() //update immediately

            }
            .disposed(by: disposeBag)
        
        
    }
    
    private func setupTableSelected(){
        teamsTableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let team:Team = self!.teamsModelView.teams!.value[indexPath.row]
                self?.performSegue(withIdentifier: "show_team", sender: team)
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
        let teamViewController:TeamViewController = segue.destination as! TeamViewController
        teamViewController.team =  sender as? Team
    }
    

}
