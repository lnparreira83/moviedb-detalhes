//
//  HomeViewMovieDetalhes.swift
//  MovieDB - Detalhes
//
//  Created by Lucas Parreira on 10/06/21.
//

import SwiftUI

struct HomeViewMovieDetalhes: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        if colorScheme == .dark {
            MovieDetalhesDarkModeView()
        } else {
            MovieDetalhesLightModeView()
        }
        
    }
}

struct HomeViewMovieDetalhes_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewMovieDetalhes()
    }
}
