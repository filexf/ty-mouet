# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
require 'faker'

# 1. Clean the database 🗑️
puts "Cleaning database..."
Mouette.destroy_all
User.destroy_all

# 2. Create the instances 🏗️
puts "Creating users..."

4.times do
  User.create!(
    first_name: Faker::Artist.name,
    last_name: Faker::Coffee.blend_name,
    email: Faker::Internet.email,
    password: "password"
  )
  puts "Creating one user..."
end

# 2. Create the instances 🏗️
puts "Creating mouettes..."


mouettes_descriptions = [
  "Une mouette blanche qui plane majestueusement dans le ciel bleu.",
  "La mouette au bec jaune qui se pose souvent près de l'eau.",
  "Une mouette curieuse observant les passants sur la plage.",
  "Cette mouette agile vole au-dessus des vagues avec grande aisance.",
  "La mouette en vol criant haut et fort, son cri résonnant dans l'air.",
  "Une mouette solitaire posée sur un rocher, contemplant l'horizon.",
  "Les mouettes virevoltantes dansent dans l'air au-dessus du rivage.",
  "Une mouette bruyante qui cherche sa nourriture près des bateaux.",
  "La mouette effrontée vole si près des gens qu'on peut presque la toucher.",
  "Une mouette gracieuse qui survole l'océan sans jamais se poser.",
  "La mouette qui plonge pour attraper un poisson, sa cible parfaitement visée.",
  "Des mouettes bruyantes se regroupent sur la plage pour se reposer.",
  "Une mouette solitaire qui observe les vagues s'écraser contre les rochers.",
  "Les mouettes au cri perçant qui s'envolent dès qu'un nuage passe.",
  "Une mouette errante qui semble se perdre dans l'immensité de l'océan.",
  "La mouette qui vole à toute vitesse, défiant les courants marins.",
  "Une mouette qui se pose tranquillement sur un mât de bateau.",
  "La mouette qui scrute la mer à la recherche de petits poissons.",
  "Une mouette sur un banc de sable, ses ailes ouvertes dans le vent.",
  "Une mouette qui déploie ses ailes pour prendre de l'altitude.",
  "Les mouettes qui se battent pour un morceau de pain jeté par un touriste.",
  "Une mouette majestueuse survolant le port au crépuscule.",
  "La mouette qui se perche sur une bouée en plein milieu de la mer.",
  "Les mouettes qui suivent les bateaux en quête de restes de poissons.",
  "Une mouette posée sur un quai, observant la mer avec calme.",
  "Les mouettes qui migrent en groupe vers des endroits plus chauds.",
  "Une mouette qui fait une pause sur le sable avant de reprendre son vol.",
  "La mouette qui se bat contre le vent lors d'une tempête marine.",
  "Les mouettes qui naviguent ensemble en suivant les vagues de l'océan.",
  "Une mouette audacieuse qui vient chercher à manger dans un marché de poisson."
]

30.times do |index|
  Mouette.create!(
    name: Faker::Creature::Bird.implausible_common_name,
    availability: "available",
    rating: rand(0..5),
    latitude: 48.083328,
    longitude: -1.68333,
    accessories: ["casque", "slip", "veste en cuir", "noeud papillon"].sample,
    description: mouettes_descriptions[index],
    price: rand(20..100),
    owner: User.all[rand(0..3)]
  )
  puts "creating one mouette"
end

# 3. Display a message 🎉
puts "Finished! Created #{Mouette.count} mouettes and #{User.count} users."
