import SwiftUI
import GoogleMobileAds

private let adUnitID = "ca-app-pub-4047470119086333/9340684452"

struct AdBannerView: UIViewRepresentable {
    @Binding var adHeight: CGFloat

    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView()
        banner.adUnitID = adUnitID
        banner.delegate = context.coordinator
        return banner
    }

    func updateUIView(_ banner: GADBannerView, context: Context) {
        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }),
              let window = scene.keyWindow else { return }
        let width = window.bounds.width
        banner.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(width)
        if banner.rootViewController == nil {
            banner.rootViewController = window.rootViewController
            banner.load(GADRequest())
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    class Coordinator: NSObject, GADBannerViewDelegate {
        let parent: AdBannerView
        init(_ parent: AdBannerView) { self.parent = parent }

        func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
            parent.adHeight = bannerView.adSize.size.height
        }
    }
}
