//
//  ViewModel.swift
//  AlbumDemoApp
//
//  Created by Neel on 11/27/24.
//

import Foundation
import UIKit

class ViewModel {
    @Published var model: [AlbumList] = []
    var apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchAlbumList() {
        apiService.fetchAlbumList { response in
            if let itemList = response {
                self.model = itemList
            }
        }
    }
    
    var numberOfItem: Int {
        model.count
    }
    
    func item(at index: Int) -> AlbumList {
        return model[index]
    }
}


