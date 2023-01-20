import SwiftUI

@available(iOS 13.0, *)
public protocol ImageLoaderProtocol {
    func loadImage(url: String, completion: @escaping (Image) -> Void)
}

@available(iOS 13.0, *)
public final class ImageLoader: ImageLoaderProtocol {
    public func loadImage(url: String, completion: @escaping (Image) -> Void) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let uiImage = UIImage(data: data) else { return }
            
            let image = Image(uiImage: uiImage)
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
    
    public static let shared = ImageLoader()
}
