//
//  RemoteImage.swift
//  Appetizer
//
//  Created by Ritik Raman on 29/05/24.
//

import SwiftUI

final class ImageLoader: ObservableObject{
    @Published var image : Image? = nil
    
    func load(fromurlstring:String){
        NetworkManager.shared.downloadImage(fromurlstring: fromurlstring) { uiImage in
            guard let uiImage = uiImage else{
                return
            }
            DispatchQueue.main.async{
                self.image=Image(uiImage: uiImage)
            }
        }
    }
    
}

struct RemoteImage:View{
    var image : Image?
    
    var body: some View{
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View{
    
    @StateObject var imageLoader=ImageLoader()
    let urlstring: String
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromurlstring: urlstring)
            }
    }
}
