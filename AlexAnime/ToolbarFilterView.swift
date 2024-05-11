//
//  ToolbarFilterView.swift
//  AlexAnime
//
//  Created by Alex  on 17/4/24.
//

import SwiftUI

struct ToolbarFilterView: View {
    @EnvironmentObject var vm: AnimeListViewModel
    
    var body: some View {
        HStack {
            Menu {
                ForEach(FilterOptions.allCases) { options in
                    Menu {
                        switch options {
                        case .animeType:
                            Picker("NOSort", selection: $vm.orderedType) {
                                ForEach(AnimeType.allCases) { animeType in
                                    Text(animeType.rawValue)
                                }
                            }
                        case .animeStatus:
                            Picker("NOSort", selection: $vm.orderedStatus) {
                                ForEach(AnimeStatus.allCases) { animeStatus in
                                    Text(animeStatus.rawValue)
                                }
                            }
                        case .animeGenre:
                            Picker("NOSort", selection: $vm.orderedGenre) {
                                ForEach(AnimeGenre.allCases) { animeGenre in
                                    Text(animeGenre.rawValue)
                                }
                            }
                        }
                    } label: {
                        Text(options.rawValue)
                    }
                }
            } label: {
                Text("Filter")
            }
            Menu {
                Picker("NOSort", selection: $vm.orderedBy) {
                    ForEach(OrderBy.allCases) { order in
                        Text(order.rawValue)
                    }
                }
            } label: {
                Text("Sort")
            }
        }
    }
}

#Preview {
    ToolbarFilterView.preview
}
