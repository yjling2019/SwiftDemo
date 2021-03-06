//
//  LandmarkList.swift
//  SwiftUITest
//
//  Created by 凌永剑 on 2021/12/9.
//

import SwiftUI

struct LandmarkList: View {
	// @EnvironmentObject 属性包装器，从上游环境中取值，如果没有提前注入会崩溃
    @EnvironmentObject var modelData: ModelData
	// @State 属性包装器，用于状态管理，当状态变更后，会重新计算ui。有点类似kvo?
    @State private var showFavoritesOnly = true

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
//    List(landmarks, id: \.id) { landmark in LandmarkRow(landmark: landmark)
//    }
        
//    List.init(landmarks, id: \Landmark.id) {  LandmarkRow(landmark: $0) }
        
//    List.init(landmarks) {
//      LandmarkRow(landmark: $0)
//    }
        
//    List(filteredLandmarks) { landmark in
//      NavigationLink.init {
//        LandmarkDetail(landmark: landmark)
//      } label: {
//        LandmarkRow(landmark: landmark)
//      }
//    }
//    .navigationTitle("Landmarks")
    
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink.init {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
	
//	static var previews: some View {
//		ContentView();
//	}
	
	struct ContentView: View {
		@State private var value = 99
		var body: some View {
			VStack(alignment: .leading) {
				Text("Number: \(value)")
				Button("+") { value += 1 }
			}
		}
	}
	
	
	
    static var previews: some View {
    LandmarkList()
      .environmentObject(ModelData())
      .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))

//        LandmarkDetail(landmark: ModelData().landmarks[0])


    }
}
