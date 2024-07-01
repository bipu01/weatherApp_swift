//
//  weatherButton.swift
//  weatherApp
//
//  Created by Biplove Gautam on 10/06/2024.
//

import SwiftUI


struct WeatherButton: View {
    @Binding var isNight: Bool
    
    var text: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Button{
            isNight.toggle()
        }label: {
            Text(isNight ? "Go back to day" : text)
                .font(.system(size: 18, weight:.semibold))
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(10)
        }
    }
}


struct WeatherButton_Previews: PreviewProvider{
    static var previews: some View{
        @State var isItNight = false
        WeatherButton(isNight: $isItNight,
                      text: "Enter here something",
                      backgroundColor: Color.blue,
                      textColor: Color.white)
    }
}
