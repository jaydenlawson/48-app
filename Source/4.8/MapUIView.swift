import SwiftUI
import GoogleMaps
import CoreLocation

struct MapUIView: UIViewRepresentable {
    let viewModel: MapViewModel
    
    func makeUIView(context: Context) -&gt; GMSMapView {
        let camera = GMSCameraPosition.camera(
            withLatitude: -33.8688,
            longitude: 151.2093,
            zoom: 13.0
        )
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        let markers = viewModel.markers
        mapView.clear()  // Clears markers, overlays
        for marker in markers {
            mapView.add(marker)
        }
    }
}

extension MapUIView {
    // No coordinator needed for basic markers
}
