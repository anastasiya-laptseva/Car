//
//  MenuViewController.swift
//  carHWalapteva
//
//  Created by Anastasiya Laptseva on 29.03.22.
//

import UIKit

class MenuViewController: UIViewController {
    let keyBestDate = "bestscore_date"
    let keyBestScore = "bestscore_score"
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        view.backgroundColor = .systemPink
        configureTableView()

        // Do any additional setup after loading the view.
    }
    @objc func fireTimer() {
        tableView.reloadData()
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseID)
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.isMultipleTouchEnabled = false
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        tableView.backgroundColor = .darkGray
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseID) as! MenuTableViewCell
        let menuModel = MenuModel(rawValue: indexPath.row)
        cell.iconImageView.image = menuModel?.image
        cell.myLabel.text = menuModel?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 4:
            reloadInfo()
            break
        case 5:
            removeAllData()
            break
        case 2:
            bestScoreAlert()
            break
        default:
            break
        }
    }
    func reloadInfo() {
        
    }
    
    func removeAllData() {
        let leftClick = UserDefaults.standard.integer(forKey: "leftClick")
        let rightClick = UserDefaults.standard.integer(forKey: "rightClick")
        var oldDate = UserDefaults.standard.object(forKey: keyBestDate) as? Date
        if oldDate == nil {
            oldDate = Date.now
        }
        let oldScore = UserDefaults.standard.integer(forKey: keyBestScore)
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        
        
        let bestScore = leftClick + rightClick
        if oldScore < bestScore {
            UserDefaults.standard.set(bestScore, forKey: keyBestScore)
            UserDefaults.standard.set(Date.now,forKey: keyBestDate)
        }
        else {
            UserDefaults.standard.set(oldScore, forKey: keyBestScore)
            UserDefaults.standard.set(oldDate,forKey: keyBestDate)
        }
    }
    
    func bestScoreAlert() {
        let bestScore = UserDefaults.standard.integer(forKey: keyBestScore)
        if(bestScore == 0) {
            showAlert(message: "No best score")
            return
        }
        
        let date = UserDefaults.standard.object(forKey: keyBestDate) as! Date
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        
        showAlert(message: "\(bestScore) points \(df.string(from: date))")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "BestScore", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
