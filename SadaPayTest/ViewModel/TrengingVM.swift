//
//  TrengingVM.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 03/08/2022.
//

import Foundation
import UIKit
class TrendingVM {
    var trendingData : Observale<TrendingModel?> = Observale(nil)
    var error :Observale<String> = Observale("")
    func callApi()  {
        NetworkingHandler.instance.getDataFromAPi(url: URL(string: BASE_URL)!, resultType: TrendingModel.self) {  (response) in
            switch response {
            case .success(let JSON):
                self.trendingData.value = JSON
            case .failure(let error):
                print(error)
                self.error.value = "\(error)"
            }
        }
        
    }
}
