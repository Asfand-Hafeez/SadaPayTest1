//
//  Constant.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 03/08/2022.
//

import Foundation


typealias Completion<T> = (Result<T,Error>) -> Void
let BASE_URL = "https://api.github.com/search/repositories?q=language=+sort:st"





extension Array where Element == Item{
    func matching(_ text: String?) -> [Item] {
        if let text = text, text.count > 0{
            return self.filter{
                ($0.fullName.lowercased().contains(text.lowercased()) || $0.description.lowercased().contains(text.lowercased()) || $0.defaultBranch.lowercased().contains(text.lowercased()))
            }
        }else{
            return self
        }
    }
}
