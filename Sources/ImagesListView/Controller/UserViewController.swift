//
//  UserViewController.swift
//  MVVM
//
//  Created by Milan Panchal on 18/03/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

public class UserViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    private var usersVM:[UserViewModel] = []
    private let cellIdentifier = "UserCell"

    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.dataSource = self
            tblView.delegate = self
            tblView.tableFooterView = UIView()
            tblView.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.9333333333, blue: 1, alpha: 1)
            tblView.separatorStyle = .none
            tblView.allowsSelection = false
        }
    }
    public static let storyboardVC = UIStoryboard(name: "UserViewController", bundle: Bundle.module).instantiateInitialViewController()!

    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
//        self.tblView?.register(UserCell.self, forCellReuseIdentifier: cellIdentifier)
        
//        self.tblView?.register(UINib.init(nibName: "UserCell", bundle: Bundle.module), forCellReuseIdentifier: "UserCell")

//        view.addSubview(self.tblView)
        
//        self.tblView?.tableFooterView = UIView()
//        self.tblView?.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.9333333333, blue: 1, alpha: 1)
//        self.tblView?.separatorStyle = .none
//        self.tblView?.allowsSelection = false
        
        
       
        
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.9333333333, blue: 1, alpha: 1)
        
        fetchUsersAPICall()
        
        NetworkManager.sharedInstance.reachability.whenUnreachable = { reachability in
            self.showOfflinePage()
        }
        
        
    }

//    private func makeViewController() -> UIViewController {
//        let name = "Main"
//        let storyboard = UIStoryboard(name: name, bundle: nil)
//        let identifier = "UserViewController"
//        let viewController =
//            storyboard.instantiateViewController(withIdentifier: identifier)
//                as! UserViewController
//        return viewController
//            }
    
    private func fetchUsersAPICall() {
        
        let totalUserLimit = Int.random(in: 5 ... 100)

        NetworkManager.sharedInstance.fetchUsers(withLimit: totalUserLimit) { [weak self] (users) in
            self?.usersVM = users.map({ return UserViewModel(user: $0)})
            DispatchQueue.main.async {
                self?.tblView?.reloadData()
                self?.navigationItem.title = "Users (\(users.count))"
            }
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersVM.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserCell else {
          fatalError("Issue dequeuing \(cellIdentifier)")
        }

        userCell.configure(userVM: usersVM[indexPath.row])
        return userCell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


//extension UserViewController: UITableViewDataSource, UITableViewDelegate {
//
//
//
//}

