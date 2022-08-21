//
//  LandmarkList.swift
//  LandMarksProjectSwiftUIDoc
//
//  Created by Ömer Faruk Kılıçaslan on 21.08.2022.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [LandMark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationView {
                    List {
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                        }

                        ForEach(filteredLandmarks) { landmark in
                            NavigationLink {
                                DetailView(landmark: landmark)
                            } label: {
                                LandmarkRow(landmark: landmark)
                            }
                        }
                    }
                    .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkList()
            .environmentObject(modelData)

    }
}