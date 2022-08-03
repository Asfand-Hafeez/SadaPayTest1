//
//  ViewController.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 02/08/2022.
//

import UIKit
import Lottie
import SkeletonView

class TrendingVC: UIViewController {
    
    
    // MARK: - Outlets & Variables
    @IBOutlet weak var animationMainView: UIView!
    @IBOutlet weak var animationView: AnimationView!
    lazy var refreshControl = UIRefreshControl()
    var tableView = UITableView()
    let trendingVM  = TrendingVM()
    
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trending"
        addMoreBtnInNavBar()
        tableViewSetup()
        retryApiData()
        trendingObserveData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
    }
    
    
    // MARK: - Api Observer
    func trendingObserveData()  {
        // Success Response
        trendingVM.trendingData.bind { [weak self] _  in
            guard let self = self else {return}
            guard let _ = self.trendingVM.trendingData.value else {return}
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.tableView.reloadData()
                self.tableView.hideSkeleton()
                self.animationView.stop()
            }
        }
        // Error Response
        trendingVM.error.bind { [weak self] _ in
            guard let self = self else {return}
            if self.trendingVM.error.value != "" {
            print("Error --------------")
            DispatchQueue.main.async {
                self.tableView.isHidden = true
                self.animationMainView.isHidden = false
                self.lottieAnimationSetup()
            }
            }
        }
        
        
    }
    
    
   
    // MARK: - Setus TV
    func tableViewSetup() {
        setupTableView(tableView)
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 95.0
        tableView.isSkeletonable = true
        tableView.register(UINib(nibName: "TrendingCell", bundle: nil), forCellReuseIdentifier: TrendingCell().identifier)
        refreshControl.addTarget(self, action: #selector(pullToRefreshCalled), for: .valueChanged)
        refreshControl.tintColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        tableView.refreshControl = refreshControl
    }
    
    
    // MARK: - Pull to Refresh Action
    @objc func pullToRefreshCalled(refreshControl: UIRefreshControl) {
        retryApiData()
        refreshControl.endRefreshing()
    }

    
    func retryApiData()  {
        animationMainView.isHidden = true
        tableView.isHidden = false
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.trendingVM.callApi()
        }
    }
    
    // MARK: - Add More Button In NavBar
    func addMoreBtnInNavBar() {
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreBtnTapped))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    
    // MARK: - Lottie Animation
    func lottieAnimationSetup()  {
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
    }
    
    
    // MARK: - Button Actions
    @IBAction func retryBtnTapped(_ sender: Any) {
        
        retryApiData()
        
    }
    
    @objc func moreBtnTapped() {
        print("More Btn Tapped")
    }
    
    
}


extension TrendingVC:SkeletonTableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  trendingVM.trendingData.value?.items.count ??  10
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return TrendingCell().identifier
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: TrendingCell().identifier, for: indexPath) as! TrendingCell
        
        if trendingVM.trendingData.value != nil {
        cell.item = trendingVM.trendingData.value?.items[indexPath.row]
        }
        return cell
    }
    
}


