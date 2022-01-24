//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by 凌永剑 on 2021/12/5.
//

import SwiftUI

@main
struct SwiftUITestApp: App {
	@StateObject private var modelData = ModelData()

	var body: some Scene {
    	WindowGroup {
	    	ContentView()
    	    	.environmentObject(modelData)
    	}
	}
}
