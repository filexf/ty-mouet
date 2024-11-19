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
require "open-uri"

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

mouettes_photos = [
  'premium_photo-1667099522599-6948e8559a4f_fmgmp4',
  'photo-1518279021261-4e9d3f2a3b60_usefpm',
  'photo-1502093323795-961ea813a668_teld8u',
  'photo-1520950134832-a75b08dd69a1_m8vrwj',
  'premium_photo-1681843802490-f4bf1df28ec7_cgdivk',
  'photo-1528731813177-bb458664c07b_gj4xyo',
  'photo-1430203185215-baf937220bfe_bjy84t',
  'premium_photo-1667573535701-556b9e103614_k5iqcb',
  'photo-1513954936412-0e067c8e6fe4_fixpjy',
  'photo-1534157252003-b15edc3e7e57_hqi9pn',
  'photo-1518138793089-8eaa76c44db9_alxg4g',
  'photo-1500516028599-28d4ab63b0bb_wbxdle',
  'blue-bird.JPG_f4xj7m',
  'premium_photo-1666257591782-a1facd821223_ba0nsd',
  'photo-1452879182034-69b22068677d_mgoavl',
  'photo-1508132979403-8348a56c812a_e0epht',
  'photo-1511421894098-86890001dadf_qlyjpj',
  'premium_photo-1663036704399-dc263b6023d2_dwqahn',
  'photo-1509908346098-12b72a6841e5_yjwi7p',
  'photo-1474829296978-7f2b714a320e_szt9fg',
  'u3x7cekkS16ajjtJcb5L_DSC_5869.jpg_eb8sj8',
  'photo-1519929436393-fe843baf2cec_tg0zzw',
  'premium_photo-1667667846223-0213b13d89c3_seixzw',
  'photo-1694824391391-ce0cde53c48e_ji8fnb',
  'photo-1514839136425-131608e01922_pn53ge',
  'premium_photo-1723719604216-bc4897f32c4f_ju79yy',
  'photo-1506364736389-da3ab3150527_gpntnu',
  'photo-1483613058497-0eba5da75ffb_lfhlkm',
  'photo-1462995708817-6ed9c9552a91_yexgh8',
  'photo-1511761884586-e0a748e2a028_vvkxni',
  'qqvrq6airlahpjpqkxsk'
]

# cloudinary_url = "https://res.cloudinary.com/dpvtwxlxh/image/upload/qqvrq6airlahpjpqkxsk.jpg"


30.times do |index|
  mouette = Mouette.new(
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
  cloudinary_url = "https://res.cloudinary.com/#{ENV["CLOUDINARY_CLOUD_NAME"]}/image/upload/#{mouettes_photos[index]}.jpg"
  file = URI.parse(cloudinary_url).open
  mouette.photo.attach(io: file, filename: "#{mouette.name}.png", content_type: "image/png")
  mouette.save!

  puts "creating one mouette"
end

# 3. Display a message 🎉
puts "Finished! Created #{Mouette.count} mouettes and #{User.count} users."
