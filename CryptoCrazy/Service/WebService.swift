//
//  WebService.swift
//  CryptoCrazy
//
//  Created by YILDIRIM on 12.06.2022.
//

import Foundation
class WebService {
    
    func downloadCurrencies(url:URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                
                let cyrptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
               
                completion(cyrptoList)
            }
        }.resume()
        
    }
    
}
