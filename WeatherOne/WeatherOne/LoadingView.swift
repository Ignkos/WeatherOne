//
//  SwiftUIView.swift
//  WeatherOne
//
//  Created by Ignat  on 31.01.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
