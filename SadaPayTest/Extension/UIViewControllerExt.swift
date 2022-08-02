//
//  UIViewControllerExt.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 02/08/2022.
//

import Foundation
import UIKit
import Lottie
extension UIViewController{
    func setupNavBar(foregroundColor: UIColor, textColor: UIColor) {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: textColor]
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.barTintColor = .systemBackground
        } else {
            navigationController?.navigationBar.barTintColor = .white
        }
        navigationController?.navigationBar.tintColor = textColor
    }
    func transparentNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
    }
    func restoreNavBar() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
        
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

