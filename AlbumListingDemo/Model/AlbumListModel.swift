//
//  AlbumListModel.swift
//  AlbumDemoApp
//
//  Created by Neel on 11/27/24.
//

import Foundation

struct AlbumList: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
