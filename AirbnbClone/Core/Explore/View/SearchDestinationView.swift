//
//  SearchDestinationView.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 3.02.2025.
//

import SwiftUI
enum SearchDestinationOption {
    case location
    case guest
    case date
}
struct SearchDestinationView: View {
    @Binding var showSearchDestination: Bool
    @EnvironmentObject var viewModel : ExploreViewModel
    @State var searchOption: SearchDestinationOption = .location
    @State var startDate = Date()
    @State var endDate = Date()
    @State var adultCount = 0


    var body: some View {

        VStack(spacing: 30) {
            navigationView


            // WHERE COLLAPSED

            if searchOption == .location {
                whereCollapsedView
                    .modifier(CollapsibleDestinationViewModifier(height: 140))
            } else {
                CollapsedPickerView(title: "Where", desc: "Add Location").onTapGesture {
                    withAnimation(.snappy) {
                        searchOption = .location
                    }
                }
            }


            // WHEN COLLAPSED

            if searchOption == .date {
                whenCollapsedView
                    .modifier(CollapsibleDestinationViewModifier(height: 180))

            } else {
                CollapsedPickerView(title: "When", desc: "Add Dates").onTapGesture {
                    withAnimation(.snappy) {
                        searchOption = .date
                    }
                }
            }



            // WHO COLLAPSED

            if searchOption == .guest {
                whoCollapsedView
                    .modifier(CollapsibleDestinationViewModifier(height: 140))
            } else {
                CollapsedPickerView(title: "Who", desc: "Add Guest").onTapGesture {
                    withAnimation(.snappy) {
                        searchOption = .guest
                    }
                }
            }
            Spacer()
        }
    }
}


extension SearchDestinationView {
    private var navigationView: some View {
        HStack {
            Button {
                withAnimation(.snappy) {
                    showSearchDestination.toggle()
                    viewModel.updateListingForLocation()
                }
            } label: {
                Image(systemName: "xmark.circle").resizable().frame(width: 25, height: 25).foregroundStyle(.black)
            }

            Spacer()
            if !viewModel.selectedLocation.isEmpty {
                Button("Cancel") {
                    viewModel.selectedLocation = ""
                }.foregroundStyle(.black)
            }

        }
    }


    private var whereCollapsedView: some View {
        VStack(alignment: .leading) {

            Text("Where to?")
                .font(.title2)
                .fontWeight(.semibold)
            HStack {
                Image(systemName: "magnifyingglass")

                TextField("Search destination", text: $viewModel.selectedLocation)
                    .font(.subheadline)
                    .submitLabel(.search)
                    .onSubmit {
                        viewModel.updateListingForLocation()
                        showSearchDestination.toggle()
                    }
                    
            }
                .padding()
                .overlay {
                RoundedRectangle(cornerRadius: 8).stroke(style: StrokeStyle(lineWidth: 1)).foregroundStyle(Color(.systemGray4))
            }
        }
    }


    private var whenCollapsedView: some View {
        VStack(alignment: .leading) {
            Text("When's your trip?")
                .font(.title2)
                .fontWeight(.semibold)

            VStack {
                DatePicker("From", selection: $startDate, displayedComponents: .date)
                Divider()
                DatePicker("To", selection: $endDate, displayedComponents: .date)
            }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)

        }
    }


    private var whoCollapsedView: some View {

        VStack(alignment: .leading) {
            Text("Who's coming?")
                .font(.title2)
                .fontWeight(.semibold)

            Stepper {
                Text("Adults \(adultCount)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            } onIncrement: {
                adultCount += 1
            } onDecrement: {
                guard adultCount > 0 else { return }
                adultCount -= 1
            }
        }
    }
}
struct CollapsibleDestinationViewModifier: ViewModifier {
    let height: CGFloat
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: height)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
    }
}
struct CollapsedPickerView: View {
    let title: String
    let desc: String
    var body: some View {

        HStack {
            Text(title).foregroundStyle(.gray)
            Spacer()
            Text(desc)
        }
            .frame(height: 64)
            .fontWeight(.semibold).font(.subheadline)
            .padding(.horizontal)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)

    }
}

#Preview {
    SearchDestinationView(showSearchDestination: .constant(true)).environmentObject(ExploreViewModel(service: ExpoloreService()))
}
