//
//  ContentView.swift
//  dateView
//
//  Created by Alessandre Livramento on 05/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUP = Date.now
    
    var body: some View {
        
        VStack {
            
            VStack {
                Spacer()
                
                Text("Stepper")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 30)
                    .background(.cyan)
                    .cornerRadius(4)
                
                
                VStack {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            VStack {
                Spacer()
                
                Text("DatePicker")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 30)
                    .background(.cyan)
                    .cornerRadius(4)
                
                VStack {
                    
                    DatePicker("Please enter a date", selection: $wakeUP, displayedComponents: .hourAndMinute)
                        .foregroundColor(.white)
                        .labelsHidden()
                    
                    
                    DatePicker("Please enter a date", selection: $wakeUP, in: Date.now...)
                        .foregroundColor(.white)
                    
                    
                    Text("Função exampleDates")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 30)
                        .background(.cyan)
                        .cornerRadius(4)
                    
                    Text(exampleDates()).multilineTextAlignment(.center)
                    
                    Text(dateComponents1())
                    Text(dateComponents2())
                    
                
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            VStack {
                Spacer()
                
                Text("Trabalhando com Datas")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 30)
                    .background(.cyan)
                    .cornerRadius(4)
                
                VStack {
        
                    
                    Text(exampleDates()).multilineTextAlignment(.center)
                        .padding()
                    
                    Text(dateComponents1())
                        .padding()
                    
                    Text(dateComponents2())
                        .padding()
                    
                    Text("Hora: \(Date.now, format: .dateTime.hour().minute())")
                        .padding()
                
                    Text("Data com format: \(Date.now, format: .dateTime.day().month().year())")
                        .padding()
                    
                    Text("Data com formatted: \(Date.now.formatted(date: .long, time: .shortened))")
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
        
    }
    
    
    func exampleDates() -> String {
        
        let now = Date.now
        // crie uma segunda instância de Date definida para um dia em segundos a partir de agora
        let tomorrow = Date.now.addingTimeInterval(86400)
        
        //crie um intervalo desses dois
        let range = Date.now...tomorrow

        return "now: \(now) \n tomorrow: \(tomorrow) \n range: \(range)"
    }
    
    func dateComponents1() -> String {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
        
        return "Components: \(date)"
    }
    
    func dateComponents2() -> String {
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        return "Hour: \(hour):\(minute)  "
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
