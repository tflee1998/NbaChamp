//
//  ContentView.swift
//  Ios3
//
//  Created by User08 on 2019/11/11.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectDate = Date()
    @State private var mvpViewer = false
    @State private var valueOfClap = 0
    @State private var showAlert = true


    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -4, to: Date())!
    var body: some View {
        GeometryReader{ geometry in
            NavigationView {
                VStack{
                    
                    if self.valueOfClap==10
                    {
                        
                           Image("champCup")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.width / 4 * 3)
                        .clipped()
                            .alert(isPresented: self.$showAlert) {
                                   Alert(title: Text("Congratulation"), message: Text("Celebrate with the team you love"))
                               }
                        
                    }
                    else
                    {
                         TenYearImage(width: geometry.size.width, selectDate: self.selectDate)
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.width / 4 * 3)
                        .clipped()
                    }
               
                        
                   
                
            
                Form{
                    DatePicker("Season:",selection: self.$selectDate, in: self.startDate...self.today ,displayedComponents: .date )
                    Toggle("View MVP:",isOn: self.$mvpViewer).sheet(isPresented: self.$mvpViewer){ShowMvp(selectDate: self.selectDate)}
                    Stepper("Clap for this team:\(self.valueOfClap)", value: self.$valueOfClap, in: 0...10)
                    }
                    NavigationLink(destination: Feedback())
                    {
                        Text("User Feedback")
                    }
            
                }
            .navigationBarTitle("NBA Champion")
            }
            
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct TenYearImage: View {
    
    let width: CGFloat
    let selectDate: Date
    var year: Int {
        return Calendar.current.component(.year, from: selectDate)
    }
    
    var body: some View {
        Image("champ\(self.year)")
            
            .resizable()
            //.brightness(self.brightnessAmount)
    }
}
struct ShowMvp: View {
    
    let selectDate: Date
    var year: Int {
        return Calendar.current.component(.year, from: selectDate)
    }
    
    var body: some View {
        VStack {
            Image("mvp\(self.year)")
                
                .resizable()
            Text("Final MVP of \(self.year)").foregroundColor(Color.red)
        }
            
            //.brightness(self.brightnessAmount)
    }
}

