//
//  Department.swift
//  MathGame
//
//  Created by Razan Aldossari on 17/06/1444 AH.
//

import SwiftUI

struct Department: View {
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    var device = UIDevice.current.userInterfaceIdiom
    var body: some View {
            ZStack{
                Back()
                
                VStack{
                    if device == .pad {
                        Image("logo")
                            .resizable()
                            .frame(width: 700,height: 400)
                            .padding(.top,-40)
                        HStack{
                            NavigationLink(destination: Addition(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "plus"), de: NSLocalizedString("Addition", comment: ""))
                            })
                            NavigationLink(destination: Subtraction(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "minus"), de: NSLocalizedString("Subtraction", comment: ""))
                            })
                        }//H
                        
                        HStack{
                            NavigationLink(destination: Multiplication(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "multiply"), de: NSLocalizedString("Multiplication", comment: ""))
                            })
                            NavigationLink(destination: Dividation(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "divide"), de: NSLocalizedString("Dividation", comment: ""))
                            })
                        }//H
                        
                    }
                    else if heightSizeClass == .compact && device == .phone {
                        Image("logo")
                            .resizable()
                            .frame(width: 400,height: 200)
                            .padding(.top,-20)
                        HStack{
                            NavigationLink(destination: Addition(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "plus"), de: NSLocalizedString("Addition", comment: ""))
                                
                            })
                            NavigationLink(destination: Subtraction(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "minus"), de: NSLocalizedString("Subtraction", comment: ""))
                            })
                            NavigationLink(destination: Multiplication(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "multiply"), de: NSLocalizedString("Multiplication", comment: ""))
                            })
                            NavigationLink(destination: Dividation(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "divide"), de: NSLocalizedString("Dividation", comment: ""))
                            })
                        }//H
                    }
                    else if device == .phone {
                        Image("logo")
                            .resizable()
                            .frame(width: 400,height: 200)
                            
                        HStack{
                            NavigationLink(destination: Addition(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "plus"), de: NSLocalizedString("Addition", comment: ""))})
                            NavigationLink(destination: Subtraction(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "minus"), de: NSLocalizedString("Subtraction", comment: ""))
                            })
                        }//H
                        HStack{
                            NavigationLink(destination: Multiplication(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "multiply"), de: NSLocalizedString("Multiplication", comment: ""))
                            })
                            NavigationLink(destination: Dividation(),
                                           label: {
                                DepartmentButton(di: Image(systemName: "divide"), de: NSLocalizedString("Dividation", comment: ""))
                            })
                        }//H
                        
                    }//else if
                }//V
                .foregroundColor(.white)
                
            }
    }
}

struct Department_Previews: PreviewProvider {
    static var previews: some View {
        Department()
    }
}
