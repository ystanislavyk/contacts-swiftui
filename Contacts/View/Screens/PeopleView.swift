import SwiftUI

struct PeopleView: View {
    @Environment(\.injected) private var injected: DependenciesContainer
    @ObservedObject private var viewData: PeopleView.Data
    
    private let peopleInteractor: PeopleInteractor
            
    init(data: PeopleView.Data, interactor: PeopleInteractor) {
        self.viewData = data
        self.peopleInteractor = interactor
    }
    
    var body: some View {
        VStack {
            SegmentedPickerView(viewMode: self.$viewData.viewMode)
            if viewData.viewMode == ViewMode.list.tag {
                PeopleListView(viewData: viewData)
            } else {
                PeopleGridView(viewData: viewData)
            }
            Button(action: {
                self.peopleInteractor.load(peopleList: self.$viewData.people)
                self.peopleInteractor.randomize(times: 100, withInterval: 1)
            }) {
                Text("Simulate Changes").fontWeight(.medium)
            }
        }
    }
}

extension PeopleView {
    enum ViewMode {
        case list
        case grid
        
        var text: String {
            switch self {
                case .list:
                    return "List"
                case .grid:
                    return "Grid"
            }
        }

        var tag: UInt8 {
            switch self {
                case .list:
                    return 0
                case .grid:
                    return 1
            }
        }
    }
}

extension PeopleView {
    class Data: ObservableObject {
        @Published var viewMode = PeopleView.ViewMode.list.tag
        @Published var people = People()
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(data: PeopleView.Data(), interactor: RealPeopleInteractor(peopleRepository: RealPeopleRepository(imagesRepository: RealImagesWebRepository(webImagesFetcher: RealWebImageFetcher()), indexRandomizer: RealIndexRandomizer()), peopleRandomizer: RealPeopleRandomizer(indexRandomizer: RealIndexRandomizer(), peopleModificationRandomizer: RealPeopleModificationRandomizer(peopleModifier: RealPeopleModifier(data: PeopleView.Data()), indexRandomizer: RealIndexRandomizer(), randomizer: RealRandomizer(peopleRepository: RealPeopleRepository(imagesRepository: RealImagesWebRepository(webImagesFetcher: RealWebImageFetcher()), indexRandomizer: RealIndexRandomizer()), imagesRepository: RealImagesWebRepository(webImagesFetcher: RealWebImageFetcher()), indexRandomizer: RealIndexRandomizer())), queuesHolder: RealQueuesHolder()), queuesHolder: RealQueuesHolder()))
    }
}
