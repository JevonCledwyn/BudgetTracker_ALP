//
//  Home.swift
//  BudgetTracker_ALP
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct Home: View {
    @StateObject var expenseViewModel : ExpenseViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 12){
                HStack(spacing: 15){
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Welcome")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("iJustine")
                            .font(.title2.bold())
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(.gray)
                            .overlay(content: {
                                Circle()
                                    .stroke(.white,lineWidth: 2)
                                    .padding(7)
                            })
                            .frame(width: 40, height: 40)
                            .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
                ExpenseCardView()
            }
            .padding()
        }
        .background{
            Color.white
                .ignoresSafeArea()
        }
    }
    // Expense Color CardView
    @ViewBuilder
    func ExpenseCardView()->some View{
        GeometryReader{proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .linearGradient(
                        Gradient(colors: [.blue, .purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            
            VStack(spacing: 15){
                VStack(spacing: 15){
                    // Current Month Date in String
                    Text(expenseViewModel.currentMonthDateString())
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    // Current Month Expenses Price
                    Text(expenseViewModel
                        .convertExpensesToCurrency(expenses: expenseViewModel.expenses))
                    .font(.system(size: 35, weight: .bold))
                    .lineLimit(1)
                    .padding(.bottom,5)
                }
                .offset(y: -10)
                
                HStack(spacing: 15){
                    Image(systemName: "arrow.down")
                        .font(.caption.bold())
                        .foregroundColor(.green)
                        .frame(width: 30,height: 30)
                        .background(.white.opacity(0.7),in: Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Income")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Text(expenseViewModel
                            .convertExpensesToCurrency(expenses: expenseViewModel.expenses, type: .income))
                        .font(.callout)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .fixedSize()
                    }
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 220)
        .padding(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
