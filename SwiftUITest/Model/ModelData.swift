//
//  ModelData.swift
//  SwiftUITest
//
//  Created by 凌永剑 on 2021/12/5.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}


var landmarks: [Landmark] = load("landmarkData.json")

#warning("入参为什么是范型？")
func load<T: Decodable>(_ filename: String) -> T {
    let data : Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    #warning("swift错误捕获")
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
