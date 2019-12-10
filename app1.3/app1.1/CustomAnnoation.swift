import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var region: CLCircularRegion!
    var info: String!
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
        region = CLCircularRegion(center: coordinate, radius: 100, identifier: title)
    }
    
}
