//
//  TrengingVM.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 03/08/2022.
//

import Foundation
import UIKit

// MARK: - Trending View Model Class
///  In this class we are using two observale object for api response  also we are calling network class which we created when api hit these two object will be notied so we can notied our UI
///  
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
