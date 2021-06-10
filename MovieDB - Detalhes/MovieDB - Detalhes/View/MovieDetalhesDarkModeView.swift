//
//  ContentView.swift
//  MovieDB - Detalhes
//
//  Created by Lucas Parreira on 8/06/21.
//

import SwiftUI
import Kingfisher

struct MovieDetalhesDarkModeView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var favorites = false
    
    var body: some View {
        NavigationView{
            VStack{
                if networkManager.loading {
                    Text("Loading...")
                } else {
                    VStack(alignment:.leading){
                        
                        ZStack(alignment:.top){
                            KFImage(URL(string: "\(networkManager.movies.BASEIMAGEURL)\(networkManager.movies.posterPath ?? "")" ))
                                .resizable()
                                .frame(height:350)
                            Image(systemName: "chevron.left")
                                .offset(x:-195, y:30)
                                .font(.system(size: 20))
                                
                        }
                        
                        VStack(alignment:.leading){
                            HStack{
                                Text(networkManager.movies.title)
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                                    .padding()
                                Spacer()
                                Button(action:{
                                    self.favorites.toggle()
                                }, label:{
                                    if favorites {
                                    Image(systemName: "heart.fill").foregroundColor(.white)
                                        .font(.system(size: 25))
                                    } else {
                                        Image(systemName: "heart").foregroundColor(.white)
                                            .font(.system(size: 25))
                                    }
                                })
                                
                                Spacer()
                            }
                            HStack{
                                Image(systemName: "heart.fill").foregroundColor(.white)
                                    .padding()
                                if favorites {
                                    Text("\(networkManager.movies.voteCount  + 1)").foregroundColor(.white)
                                        .padding(5)
                                } else {
                                    Text("\(networkManager.movies.voteCount  )").foregroundColor(.white)
                                        .padding(5)
                                }
                                
                                
                                Image(systemName: "film").foregroundColor(.white)
                                Text("\(networkManager.movies.popularity) views").foregroundColor(.white)
                            }
                            
                        }
                    
                            MovieSimilarDetalhesDarkModeView()
                            
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.all)
                    .background(Color.black)
                    
                    
                    
                }
                
            }
        }
    }
}

struct MovieDetalhesDarkModeView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetalhesDarkModeView()
    }
}
