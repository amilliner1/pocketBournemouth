import UIKit
import MapKit


class ViewController: UIViewController {
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
 
let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()

        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        mapView.userTrackingMode = .follow
        

        
        
        
        
        
        
    //    let annotation = CustomAnnotation(coordinate: CLLocationCoordinate2D(50.741972, -1.897156)
    //    annotation.coordinate = CLLocationCoordinate2DMake(50.741972, -1.897156)
    //    mapView.addAnnotation(annotation)
    //    annotation.title = "Talbot Campus"
        
        let x = CLLocationCoordinate2DMake(50.715634, -1.874866)
        let annotationTwo = CustomAnnotation(coordinate: x, title: "Bournemouth Pier")
        mapView.addAnnotation(annotationTwo)
        locationManager.stopMonitoring(for: annotationTwo.region)
        
//        let annotationThree = MKPointAnnotation()
//        annotationThree.title = "Bournemouth Gardens"
//        annotationThree.coordinate = CLLocationCoordinate2DMake(50.7174, -1.8763)
//        mapView.addAnnotation(annotationThree)
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.showAnnotations(mapView.annotations, animated: true)
            
        
        
    
    
    }
    
    @IBAction func openButton(_ sender: Any) {
    }
    
    
}


extension ViewController: CLLocationManagerDelegate {
  
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        
        for annotation in mapView.annotations {
            if annotation.title == region.identifier {
                if let annotation = annotation as? CustomAnnotation {
                    //we have the annoation in question...do whatever
                    print(annotation.title)
                    
                }
            }
        }
        
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        imageView.image = nil
        labelOne.text = nil

    }

}



extension ViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    }



//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        if annotation is MKUserLocation { return nil }
//
//            let annotationView: MKMarkerAnnotationView?
//
//            if let dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: "identifier") as? MKMarkerAnnotationView {
//                annotationView = dequedView
//            } else{
//                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "identifier")
//            }
//        }
//    }
}
