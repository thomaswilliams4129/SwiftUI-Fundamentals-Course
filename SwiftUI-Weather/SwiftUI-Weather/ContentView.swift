//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Thomas Williams on 6/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var weeklyWeather: [WeatherDay] = getWeeklyWeather()
    
    var body: some View {
        ZStack {
            // background
            BackgroundView(isNight: $isNight)
            
            // Main VStack
            VStack {
                CityTextView(cityName: "Curpertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 75)
                
                HStack(spacing: 20) {
                    
                    ForEach(weeklyWeather) { day in
                        WeatherDayView(dayOfWeek: day.dayoftheWeek, imageName: day.imageName, temperature: day.temperature)
                    }
                }
                
                Spacer()
                
                Button{
                   //action
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
            
                        
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)º")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack(spacing: 8) {
           Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)º")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

class WeatherDay: Identifiable {
    var dayoftheWeek: String
    var imageName: String
    var temperature: Int
    var id: String {dayoftheWeek}
    
    
    init(dayoftheWeek: String, imageName: String, temperature: Int) {
        self.dayoftheWeek = dayoftheWeek
        self.imageName = imageName
        self.temperature = temperature
    }
}

func getWeeklyWeather() -> [WeatherDay] {
    
    var weeklyWeather: [WeatherDay] = []
    
    weeklyWeather.append(WeatherDay(dayoftheWeek: "TUE", imageName: "cloud.sun.fill", temperature: 75))
    weeklyWeather.append(WeatherDay(dayoftheWeek: "WED", imageName: "cloud.sun.fill", temperature: 75))
    weeklyWeather.append(WeatherDay(dayoftheWeek: "THU", imageName: "cloud.sun.fill", temperature: 75))
    weeklyWeather.append(WeatherDay(dayoftheWeek: "FRI", imageName: "cloud.sun.fill", temperature: 75))
    weeklyWeather.append(WeatherDay(dayoftheWeek: "SAT", imageName: "cloud.sun.fill", temperature: 75))
    
    
    return weeklyWeather
    
}
