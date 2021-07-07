//
//  ContentView.swift
//  recipe
//
//  Created by Stox on 2021-07-06.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView{
            List(model.recipes) { r in
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        
                    
                HStack(spacing: 20.0) {
                    Image(r.image).resizable().scaledToFill().frame(width: 50.0, height: 50.0).clipped().cornerRadius(5)
                    Text(r.name)
                }})
            }.navigationBarTitle("All Recipes")
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
