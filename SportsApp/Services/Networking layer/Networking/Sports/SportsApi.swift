//
//  SportsApi.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
protocol SportsAPiProtocol {
    func getSports(complition: @escaping(Result<SportsResponse?,NSError>)->Void)
}
class SportsAPi:BaseApi<ALLSportsNetwork>,SportsAPiProtocol
{
    static let shared = SportsAPi()
    func getSports(complition: @escaping(Result<SportsResponse?,NSError>)->Void) {
        self.fetchData(target: .getSports, responseClass: SportsResponse.self) { (result) in
            complition(result)
        }
    }
}
