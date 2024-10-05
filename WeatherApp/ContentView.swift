// ContentView.swift
// WeatherApp
// Created by Lasha Tavberidze on 19.11.23.

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    var weekDays : [String] = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    
    var body: some View {
        ZStack {
            ukanafoni(isNight: $isNight)
            VStack {
            CityView(CityName: "Georgia, Tbilisi")

                VStack {
                    mainWeatherView(temperature: 19, weatherImg: "moon.fill")
                }
                .padding(.bottom, 60)

                HStack(spacing: 13) {
                    ForEach( 0..<5){ day in
                        WeatherDayView(dayOfWeek: weekDays[day], imageName: "cloud.moon.fill", temperature: 10)
                    }
               
                }

                Spacer()

                Button(action: {
                    isNight.toggle()
                }) {
                    Text("Flip the day")
                        .foregroundColor(.teal)
                        .font(.system(size: 26, weight: .semibold, design: .serif))
                        .frame(width: 200, height: 60)
                        .background(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 70)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.yellow)
                .shadow(color: .pink, radius: 15)

            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color: .blusha, radius: 10)
                .frame(width: 60, height: 60, alignment: .center)

            Text("\(temperature)°")
                .font(.system(size: 27, weight: .semibold, design: .rounded))
                .foregroundColor(.indigo)
                .shadow(color: .blusha, radius: 10)
        }
    }
}

struct ukanafoni: View {
   
    @Binding var isNight : Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]),
            startPoint: .top,
            endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CityView: View {
    
    var CityName: String
    var body: some View {
        
        Text(CityName)
            .font(.system(size: 32, weight: .light, design: .default))
            .foregroundColor(.white)
            .shadow(color: .accentColor, radius: 10)
            .padding()
        
    }
}
struct mainWeatherView : View {
    
    var temperature : Int
    var weatherImg : String
    var body: some View {
        Image(systemName: weatherImg)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .accentColor, radius: 2)
            .frame(width: 178, height: 178, alignment: .center)

        Text("\(temperature)°")
            .font(.system(size: 80, weight: .semibold, design: .rounded))
            .foregroundColor(.indigo)
            .shadow(color: .cyan, radius: 3)
    }
}
