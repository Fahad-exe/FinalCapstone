//
//  MapView.swift
//  AppleCarPlay
//
//  Created by Fahad Matlagitu on 15/12/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    
    @Environment(\.openURL) var openURL
    @State var PresentedSheet : Bool = false
    
    @StateObject var locationManager = LocationManager1()
    
    @State var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    @State var mapSelection: Int?
    
    
     var selectedPlace: MapModel? {
        if let mapSelection {
            return ChargingLocations.first(where: { $0.id.hashValue == mapSelection.hashValue })
        }
        return nil
    }
    
    var body: some View {
        VStack{
            ZStack{
                
                
                Map(position: $cameraPosition, selection: $mapSelection){
                    UserAnnotation()
                    ForEach(ChargingLocations, id: \.id) { location in
                        Marker("Plumming Stores",coordinate: location.location)
                            .tint(.green)
                            .tag(location.id)
                    }
                    
                }
                .frame(width: 375, height: 740)
                .padding(.bottom,26)
                .padding(.top,24)
                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 40,bottomTrailingRadius: 40))
                .onChange(of: mapSelection, { oldValue, newValue in
                    PresentedSheet = newValue != nil
                })
                .sheet(isPresented: $PresentedSheet) {
                    VStack{
                        Rectangle()
                            .frame(width: 30, height: 2)
                            .foregroundStyle(.invertedBK)
                            .padding()
                        Spacer()
                        Text((selectedPlace?.MainAddress)!)
                            .bold()
                            .frame(maxWidth: 350,alignment:.leading)
                            
                        Text((selectedPlace?.StreetAddress)!)
                            .font(.caption)
                            .frame(maxWidth: 350,alignment:.leading)
                        Text((selectedPlace?.portsAvailable)!)
                            .font(.caption)
                            .frame(maxWidth: 350,alignment:.leading)
                        Spacer()
                    
                       
                        Button {
                            openURL(URL(string: "comgooglemaps://?saddr=&daddr=RHZA2943,Riyadh&directionsmode=driving")!)
                        } label: {
                            Text("Open in Google Maps")
                                
                        }
                        .padding(32)
                        .foregroundStyle(.BK)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.green).frame(width: 350, height: 50))
                        

                    }
                    .presentationDetents([.medium])
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.invertedBK)
                    .background(Color("bck"))
                    .frame(maxHeight: .infinity,alignment:.top)
                }
                .mapControls {
                    MapUserLocationButton()
                }
                .onAppear{
                    locationManager.requestLocation()
                    
                }
                
                
            }
            
            Spacer()
            
        }
        
    }
    
}


#Preview {
    MapView()
}

extension CLLocationCoordinate2D {
    static var userLocation : CLLocationCoordinate2D {
        return .init(latitude: 24.774265, longitude: 46.738586)
    }
}

extension MKCoordinateRegion {
    static var userRegion : MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 100000)
    }
}
