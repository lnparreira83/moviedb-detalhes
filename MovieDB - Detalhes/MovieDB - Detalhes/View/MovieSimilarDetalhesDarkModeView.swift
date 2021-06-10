//
//  MovieSimilarDetalhesView.swift
//  MovieDB - Detalhes
//
//  Created by Lucas Parreira on 8/06/21.
//

import SwiftUI
import Kingfisher

struct MovieSimilarDetalhesDarkModeView: View {
    @ObservedObject var networkManagerSimilarMovie = NetworkManagerSimilarMovie()
    
    var body: some View {
        
            VStack{
                ZStack{
                    List(networkManagerSimilarMovie.moviesSimilar.results, id: \.id){ movie in
                        KFImage(URL(string: "\(movie.BASEIMAGEURL)\(movie.posterPath ?? "No image")"))
                            .resizable()
                            .frame(width:75,height: 105)
                        VStack(alignment:.leading){
                            Text(movie.title)
                                .bold()
                                .font(.headline)
                                .foregroundColor(.white)
                            HStack{
                                let year = movie.releaseDate
                                let yearEnd = year.firstIndex(of: "-")!
                                let yearFormatted = year[..<yearEnd]
                                Text(String(yearFormatted)).foregroundColor(.white)
                                
                                
                            }
                            
                        }
                    }
                }.background(Color.black)
                
        }
    }
}

struct MovieSimilarDetalhesDarkModeView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSimilarDetalhesDarkModeView().preferredColorScheme(.dark)
    }
}

