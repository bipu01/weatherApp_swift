//
//  ContentView.swift
//  weatherApp
//
//  Created by Biplove Gautam on 09/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundGradient(isNight: isNight)
            
            VStack(spacing: 10){
                CityName(city: "Kathmandu, Nepal")
                weatherInfo(iconName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 23 : 31)
                
                HStack(spacing:12){
                    DaysOfTheWeek(dayOfTheWeek: "Sun", 
                                  imageName: "cloud.fill",
                                  temperature: 32)
                    
                    DaysOfTheWeek(dayOfTheWeek: "MON", 
                                  imageName: "cloud.drizzle.fill",
                                  temperature: 28)
                    
                    DaysOfTheWeek(dayOfTheWeek: "TUE", 
                                  imageName: "cloud.sun.fill",
                                  temperature: 29)
                    
                    DaysOfTheWeek(dayOfTheWeek: "WED", 
                                  imageName: "cloud.sun.bolt.fill",
                                  temperature: 31)
                    
                    DaysOfTheWeek(dayOfTheWeek: "THU", 
                                  imageName: "smoke.fill",
                                  temperature: 33)
                    
                    DaysOfTheWeek(dayOfTheWeek: "FRI", 
                                  imageName: "cloud.sun.fill",
                                   temperature: 31)
                }
                
                Spacer()
                
                WeatherButton(isNight: $isNight, text: "Change time of day",
                              backgroundColor: Color.black,
                              textColor: Color.white)
//                var backgroundColor: Color
//                var textColor: Color
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}



struct DaysOfTheWeek:View {
    var dayOfTheWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack{
            Text(dayOfTheWeek)
                .foregroundColor(.white)
                .font(.system(size:18, weight: .regular))
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundStyle(.blue)
                .aspectRatio(contentMode:.fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
        }
    }
}

struct CityName: View {
    var city: String
    
    var body: some View {
        Text(city)
            .foregroundColor(.white)
            .font(.system(size: 28, weight: .medium))
            .padding()
    }
}

struct weatherInfo: View {
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .medium))
            
        }
        .padding(.bottom, 40)
    }
}

struct BackgroundGradient :View{
    var isNight: Bool
    
    var body: some View {
        //        LinearGradient(colors: [isNight ? .black : .blue,
        //                                isNight ? .gray : Color("lightBlue")
        //                               ],
        //                       startPoint: .topLeading,
        //                       endPoint: .bottomTrailing).ignoresSafeArea()
        //    }
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}
