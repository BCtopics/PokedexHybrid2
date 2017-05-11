//
//  PokemonSearchViewController.swift
//  PokedexHybrid2
//
//  Created by Bradley GIlmore on 5/11/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        DMNPokemonController.fetchPokmeon(forSearchTerm: searchTerm) { (pokemon) in
            DispatchQueue.main.async {
                guard let pokemon = pokemon else { return }
                self.nameLabel.text = pokemon.name
                self.idLabel.text = "ID: \(pokemon.identifier)"
                self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
            }
        }
    }
}
