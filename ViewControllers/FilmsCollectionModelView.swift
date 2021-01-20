//
//  FilmsCollectionModelView.swift
//  BlizzardPersonalApp
//
//  Created by Diego Monteagudo on 1/19/21.
//

// no debe saber nada del UI
// bindings
//rx swift - bond
//Eventos
//propiedad observable
//enum - data

//UIImage extensión
//cell for row
//NSCache swift = key string url e imagen como data


class FilmsCollectionViewModel {
    let filmDataProvider = FilmsDataProvider()
    var filmDataCollection: [Film] = []

//    var imgDataCollection: [UIImage] = []
    
    func fetchData () {
        filmDataProvider.getFilmsData(page: 1){ (response) in
            self.filmDataCollection = response.results
           
        }
    }
    
}
