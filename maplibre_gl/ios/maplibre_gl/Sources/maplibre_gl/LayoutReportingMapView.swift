import MapLibre

/// An `MLNMapView` that reports when it is laid out.
///
/// Flutter creates a platform view before UIKit gives it a frame, and a style
/// loaded from a local asset parses in-process — so the map's initial camera
/// positioning routinely arrives while the view still has no size. A camera
/// update there cannot be applied (see `MapLibreMapController.canUpdateCamera`)
/// but must not be thrown away either: it is usually the only positioning the
/// map will ever be sent. `layoutSubviews` is the moment the size arrives, and
/// the only signal for it UIKit offers — `bounds` is not usefully observable.
class LayoutReportingMapView: MLNMapView {
    var onLayoutSubviews: (() -> Void)?

    override func layoutSubviews() {
        super.layoutSubviews()
        onLayoutSubviews?()
    }
}
