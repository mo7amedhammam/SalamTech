//
//  PatientDetails.swift
//  SalamTak
//
//  Created by Mohamed Hammam on 07/06/2022.
//

import Foundation
import SwiftUI
struct PatientDetails: View {
    
    var body: some View {
        VStack(){
            HStack {
                Text("Patient_details".localized(language))
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 20))
            }
            .padding(.horizontal,30)
            .padding(.vertical,8)
            .background(Color.salamtackWelcome)
            .cornerRadius(25)
            
            HStack(){
                Image("person")
                    .resizable()
                    .foregroundColor(Color("darkGreen"))
                    .frame(width: 25, height: 25)
                    .padding(8)
                    .clipShape(Circle())
                    .AddBlueBorder(cornerRadius: 25,linewidth: 1.2)

                VStack(alignment:.leading){
                    Text("Patient_Name_:".localized(language))
                        .foregroundColor(.salamtackBlue)
                        .font(.system(size: 15))
                        .bold()
                    Text(Helper.getpatientName())
                        .foregroundColor(.black.opacity(0.7))
                        .font(Font.SalamtechFonts.Reg14)
                }
                .environment(\.layoutDirection, language.rawValue == "en" ? .leftToRight : .rightToLeft)
                
                .padding(.trailing)
                Spacer()
            }.padding(.leading)
                .environment(\.layoutDirection, language.rawValue == "en" ? .leftToRight : .rightToLeft)
            
            HStack{
                Image("Phone")
                    .resizable()
                    .foregroundColor(Color("darkGreen"))
                    .frame(width: 25, height: 25)
                    .padding(8)
                    .clipShape(Circle())
                    .AddBlueBorder(cornerRadius: 25,linewidth: 1.2)

                VStack(alignment:.leading){
                    Text("Patient_Number_:".localized(language))
                        .foregroundColor(.salamtackBlue)
                        .font(.system(size: 16))
                        .bold()
                    Text("\(Helper.getUserPhone() )" )
                        .foregroundColor(.black.opacity(0.7))
                        .font(Font.SalamtechFonts.Reg14)
                }
                .padding(.trailing)
                Spacer()
            }.padding(.leading)
                .environment(\.layoutDirection, language.rawValue == "en" ? .leftToRight : .rightToLeft)
//            HStack{
//                Circle()
//                    .fill(Color("CLVBG"))
//                    .shadow(color: .black.opacity(0.2), radius: 2)
//                    .frame(width: 40, height: 40).padding(.leading,-20)
//                Image("Line")
//                    .resizable()
//                    .renderingMode(.original)
//                    .tint(.black)
//                    .frame( height: 2)
//                    .foregroundColor(.black)
//                Circle()
//                    .fill(Color("CLVBG"))
//                    .shadow(color: .black.opacity(0.2), radius: 2)
//                    .frame(width: 40, height: 40).padding(.trailing,-20)
//            }
//            .padding(.bottom,0)
//            .environment(\.layoutDirection, language.rawValue == "en" ? .leftToRight : .rightToLeft)
           
        }
    }
}


struct PatientDetails_Previews: PreviewProvider {
    static var previews: some View {
        PatientDetails()
    }
}
