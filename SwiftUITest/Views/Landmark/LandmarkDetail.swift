//
//  LandmarkDetail.swift
//  SwiftUITest
//
//  Created by 凌永剑 on 2021/12/9.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
	@EnvironmentObject var modelData: ModelData
	var landmark: Landmark
	
	var landmarkIndex: Int {
		modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
	}
	
	var body: some View {
		VStack {
			MapView(coordinate:landmark.locationCoordinate)
				.ignoresSafeArea(edges: .top)
				.frame(height:300)
			
			CircleImage(image: landmark.image)
				.offset(y: -130)
				.padding(.bottom, -130)
			
			VStack(alignment: .leading) {
				HStack {
					Text(landmark.name)
						.font(.title)
					FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
				}
				
				Text(landmark.name)
					.font(.title)
				
				HStack {
					Text(landmark.park)
						.font(.subheadline)
					
					Spacer()
					
					Text(landmark.state)
						.font(.subheadline)
				}
				
				Divider()
				
				Text("About \(landmark.name)")
					.font(.title2)
				Text(landmark.description)
			}
			.padding()
			
			Spacer()
		}
		
		.navigationTitle(landmark.name)
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct LandmarkDetail_Previews: PreviewProvider {
	static let modelData = ModelData()

	static var previews: some View {
		//environmentObject 将公共数据注入环境，方便下游读取，避免层层传递
		LandmarkDetail(landmark: modelData.landmarks[0])
			.environmentObject(modelData)
	}
}
