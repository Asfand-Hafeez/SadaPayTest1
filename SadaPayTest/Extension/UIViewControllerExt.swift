//
//  UIViewControllerExt.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 02/08/2022.
//


import UIKit


extension UIViewController{
    
    
    /// Add Table view Programmatically
    /// - Parameter tableView: just pass tableView type variable
    func setupTableView(_ tableView: UITableView) {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.contentInset = .init(top: 20, left: 0, bottom: 20, right: 0)
        tableView.tableFooterView = UIView()
    }
    
    
}

