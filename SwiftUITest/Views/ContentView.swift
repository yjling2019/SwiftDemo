//
//  ContentView.swift
//  SwiftUITest
//
//  Created by 凌永剑 on 2021/12/5.
//

import SwiftUI

//struct TestModel {
//  static let m3 : TestModel = TestModel();
//  static let m4 : TestModel = TestModel();
//}
//
//struct Model {
////	static let m1 : Model = Model();
////	static let m2 : Model = Model();
//
//  func someFunc(model : TestModel) -> Void {
//
//  }
//
//  func test() -> Void {
//	  someFunc(model: .m3);
//  }
//}

struct ContentView: View {
	var body: some View {
    	LandmarkList()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
    	ContentView()
	    	.environmentObject(ModelData())
	}
}
