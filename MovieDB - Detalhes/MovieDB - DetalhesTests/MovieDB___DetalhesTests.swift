//___FILEHEADER___

import XCTest
@testable import MovieDB___Detalhes

class teste_TheMovieDBTests: XCTestCase {

    private var manager: NetworkManager!
    private var movies: MockMovieList!
    
    override func setUpWithError() throws {
        manager = NetworkManager()
    }

    func test_successfull_network_connection_isNotEmpty(){
        if manager.movies.BASEIMAGEURL != "" {
            let checkUrl = true
            XCTAssertTrue(checkUrl)
        }
        else {
            let checkUrl = false
            XCTAssertTrue(checkUrl)
        }
        
    }
    
    func test_URL_Connection() throws {
        
        let testURL = MockNetworkManager()
        guard let baseURL = URL(string: (testURL.base_url_mock) + (testURL.api_key_mock) + (testURL.language_mock)) else { return }
     
        XCTAssertTrue(!baseURL.isFileURL)
        
        }
    

    
    func test_unsuccessfull_decoding_manager_start_empty(){
        //XCTAssertNotEqual(manager,1)
    }
    

}

final class MockNetworkManager {

    let api_key_mock = "c2e78b4a8c14e65dd6e27504e6df95ad"
    let base_url_mock = "https://api.themoviedb.org/3/movie/now_playing?api_key="
    let language_mock = "&language=pt-BR"
}


struct MockMovie: Codable, Identifiable {
        var id: Int
        let originalLanguage, originalTitle, overview: String
        let popularity: Double
        let posterPath, releaseDate, title: String
        let video: Bool
        let voteAverage: Double
        let voteCount: Int
        
        let baseImageURL = "https://image.tmdb.org/t/p/w500/"
        
        enum CodingKeys: String, CodingKey {
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    
    
    }

struct MockMovieList: Codable {
    var results : [MockMovie]
}
