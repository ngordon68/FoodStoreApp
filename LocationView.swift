//
//  LocationView.swift
//  GreenDream
//
//  Created by Nick Gordon on 10/10/22.
//

import SwiftUI
import MapKit

struct Locations:Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let image:String
    
    
    func description() -> String {
        return "\(self.name) is located right in Detroit! Check the Map above for which streets it is located on"
    }
    
}

let locations = [
    
    Locations(name: "Eastern Market", coordinate: CLLocationCoordinate2D(latitude: 42.3498, longitude: -83.0408), image: "EasternMarket"),
    
    Locations(name: "Apple Developer Academy", coordinate: CLLocationCoordinate2D(latitude: 42.3312, longitude: -83.0457), image: "FirstNational")
    
]

struct LocationView: View {
    

    @State private var firstLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3498, longitude: -83.0407), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State var description = ""
    @State var image = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.7568627450980392, green: 0.8352941176470589, blue: 0.5607843137254902)
                    .frame(width: 500, height:225)
                    .offset(y: -450)
              
                VStack {
                    
                    Map(coordinateRegion: $firstLocation, annotationItems: locations) {
                        locations in MapAnnotation(coordinate: locations.coordinate)
                                            {
                        
                                               Image(systemName: "mappin.and.ellipse")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 30))
                                                    .onTapGesture {
                                                        description = locations.description()
                                                        image = locations.image
                                                    }
                                            }
                        
                    }
                    .padding(.top, 65)
                    .frame(width: 400, height: 400)
                    .navigationTitle("Explore Detroit")
                    
                    Text("Description")
                        .font(.system(size:36))
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:120)
                    Text(description)
                        .frame(width: 300, height: 200)
                        .offset(y: -30)
                    
                }
            }
        }
        
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
