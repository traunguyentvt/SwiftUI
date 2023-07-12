//
//  Inspiration.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct Inspiration: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    
    static func createInspirations() -> [Inspiration] {
        [
            Inspiration(name: "Desert",
                        imageName: "desert",
                        description: "A desert is a barren area of landscape where little precipitation occurs and, consequently, living conditions are hostile for plant and animal life."),
            Inspiration(name: "Tree",
                        imageName: "tree",
                        description: "In botany, a tree is a perennial plant with an elongated stem, or trunk, usually supporting branches and leaves."),
            Inspiration(name: "Mountain Air",
                        imageName: "mountain",
                        description: "A mountain is an elevated portion of the Earth's crust, generally with steep sides that show significant exposed bedrock"),
            Inspiration(name: "Moos Trees",
                        imageName: "trees-moos",
                        description: "In our unique moss farm we cultivate natural, pure and high performance moss. This forms the green basis for our regenerative moss filters."),
            Inspiration(name: "Sky",
                        imageName: "sky",
                        description: "The sky is an unobstructed view upward from the surface of the Earth. It includes the atmosphere and outer space. "),
            Inspiration(name: "Death Valley",
                        imageName: "death-valley",
                        description: "In this below-sea-level basin, steady drought and record summer heat make Death Valley a land of extremes. "),
            Inspiration(name: "Mont Blanc",
                        imageName: "mont-blanc",
                        description: "Mont Blanc is the highest mountain in the Alps and Western Europe. It is the second-most prominent mountain in Europe, after Mount Elbrus."),
            Inspiration(name: "Rolling Hills",
                        imageName:"hills",
                        description: "A hill is a landform that extends above the surrounding terrain. It often has a distinct summit." ),
            Inspiration(name: "Automn Colors",
                        imageName: "automn",
                        description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy."),
            Inspiration(name: "Minime",
                        imageName: "minime",
                        description: "True minime is awesome.")
        ]
    }
}
