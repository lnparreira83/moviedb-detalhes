//
//  MovieDetalhesLightModeView.swift
//  MovieDB - Detalhes
//
//  Created by Lucas Parreira on 10/06/21.
//

import SwiftUI
import Kingfisher

struct MovieDetalhesLightModeView: View {
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
                                .offset(x:-175)
                                .font(.system(size: 20))
                        }
                        
                        VStack(alignment:.leading){
                            HStack{
                                Text(networkManager.movies.title)
                                    .foregroundColor(.black)
                                    .bold()
                                    .font(.title)
                                    .padding()
                                Spacer()
                                Button(action:{
                                    self.favorites.toggle()
                                }, label:{
                                    if favorites {
                                    Image(systemName: "heart.fill").foregroundColor(.red)
                                        .font(.system(size: 25))
                                    } else {
                                        Image(systemName: "heart").foregroundColor(.black)
                                            .font(.system(size: 25))
                                    }
                                })
                                
                                Spacer()
                            }
                            HStack{
                                Image(systemName: "heart.fill").foregroundColor(.white)
                                    .padding()
                                if favorites {
                                    Text("\(networkManager.movies.voteCount  + 1)").foregroundColor(.black)
                                        .padding(5)
                                } else {
                                    Text("\(networkManager.movies.voteCount  )").foregroundColor(.black)
                                        .padding(5)
                                }
                                
                                
                                Image(systemName: "film").foregroundColor(.black)
                                Text("\(networkManager.movies.popularity) views").foregroundColor(.black)
                            }
                            
                        }
                    
                            MovieSimilarDetalhesLightModeView()
                            
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                }
                
            }
        }
    }
}

struct MovieDetalhesLightModeView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetalhesLightModeView()
    }
}
