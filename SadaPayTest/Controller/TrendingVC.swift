//
//  ViewController.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 02/08/2022.
//

import UIKit
import Lottie

class TrendingVC: UIViewController {
    
    @IBOutlet weak var animationMainView: UIView!
    @IBOutlet weak var animationView: AnimationView!
    lazy var refreshControl = UIRefreshControl()
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Trending"
        
        
//        lottieAnimationSetup()
        
        animationMainView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TrendingCell", bundle: nil), forCellReuseIdentifier: "cell")

        setupTableView(tableView)
        addMoreBtnInNavBar()
        
            refreshControl.addTarget(self, action: #selector(doSomething), for: .valueChanged)
        refreshControl.tintColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
            tableView.refreshControl = refreshControl
    }

    @objc func doSomething(refreshControl: UIRefreshControl) {
        print("Hello World!")
        
        // somewhere in your code you might need to call:
        refreshControl.endRefreshing()
    }

    
    func addMoreBtnInNavBar() {
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreBtnTapped))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationController?.navigationBar.tintColor = .black
    }
    
   @objc func moreBtnTapped() {
       print("More Btn Tapped")
    }
    
    
    // MARK: - Lottie Animation
    func lottieAnimationSetup()  {
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
    }
    
    
    
    @IBAction func retryBtnTapped(_ sender: Any) {
        animationMainView.isHidden = true
        animationView.stop()
        
        
    }
    
}


extension TrendingVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrendingCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
}
