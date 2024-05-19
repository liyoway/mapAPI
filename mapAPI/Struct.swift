//
//  Struct.swift
//  mapAPI
//
//  Created by yoway Li on 2024/5/18.
//

import Foundation

struct MapInfo: Codable {
    let records: [Record]
}

// 定義 Record 結構，包含紀錄 ID、建立時間和詳細資訊
struct Record: Codable {
    let id, createdTime: String
    let fields: Fields
}

// 定義 Fields 結構，包含區域圖像、區域資訊和區域名稱
struct Fields: Codable {
    let areaImage: [AreaImage]
    let areaInfo: String
    let areaName: String
}

// 定義 AreaImage 結構，包含圖像的各種屬性
struct AreaImage: Codable {
    let id: String
    let width, height: Int
    let url: String
    let filename: String
    let size: Int
}
