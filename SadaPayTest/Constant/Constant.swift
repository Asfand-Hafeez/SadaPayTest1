//
//  Constant.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 03/08/2022.
//

import Foundation

typealias Completion<T> = (Result<T,Error>) -> Void
let BASE_URL = "https://api.github.com/search/repositories?q=language=+sort:"
