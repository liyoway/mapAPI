//
//  Function.swift
//  mapAPI
//
//  Created by yoway Li on 2024/5/18.
//

import Foundation

var mapInfoData: MapInfo?
func fetchData(completion: @escaping (MapInfo?) -> Void) {
    if let url = URL(string: "https://api.airtable.com/v0/app1MfmI8sP5PmaSp/mapInfo") {
        var request = URLRequest(url: url)
        // 設置授權標頭
        request.setValue("Bearer patYTRmUpfnX3K54j.4624ca34ef64ebaa6f4d4628503959e7fef17e6dbe8577bbfc8773ed30fcc566", forHTTPHeaderField: "Authorization")
        
        // 發送 HTTP 請求
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                // 列印 JSON 資料
                let decoder = JSONDecoder()
                do {
                    // 將 JSON 資料解碼成 MapInfo 結構
                    let result = try decoder.decode(MapInfo.self, from: data)
                    mapInfoData = result // 將解碼結果存入全域變數
                    completion(result) // 調用完成閉包
                } catch {
                    print(error)
                    completion(nil) // 如果解碼失敗，傳回 nil
                }
            } else if let error {
                print(error)
                completion(nil) // 如果請求失敗，傳回 nil
            }
        }.resume()
    }
}

