# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
Event.destroy_all
Profile.destroy_all
Prestation.destroy_all
p "destroy1"
Reply.destroy_all
User.destroy_all
Recomand.destroy_all
Group.destroy_all
Category.destroy_all
Post.destroy_all
SchoolChild.destroy_all

p "creating users"
user_rachel = User.new(email: 'sonia.langlet@gmail.com', password: "password", first_name: 'Rachel', last_name: "Markle")
user_rachel.remote_photo_url = "http://res.cloudinary.com/ddfczdsao/image/upload/q_auto:low/v1513851194/i7bvn6hhb4ptpvproovl.png"
user_rachel.save

user_sophie = User.new(email: 's.onialanglet@gmail.com', password: "password", first_name: 'Sophie', last_name: "Bilbo", )
user_sophie.remote_photo_url = "http://res.cloudinary.com/ddfczdsao/image/upload/q_auto:low/v1513795634/hkhutgh1ckkch2mqvi5e.jpg"
user_sophie.admin = true
user_sophie.save

user_marie = User.new(email: 'so.nialanglet@gmail.com', password: "password", first_name: 'Marie', last_name: "Kenz")
user_marie.remote_photo_url = "http://res.cloudinary.com/ddfczdsao/image/upload/q_auto:low/v1513795634/hkhutgh1ckkch2mqvi5e.jpg"
user_marie.save

user_valerie = User.new(email: 'son.ialanglet@gmail.com', password: "password", first_name: 'Valerie', last_name: "Doodle", )
user_valerie.remote_photo_url = "http://res.cloudinary.com/ddfczdsao/image/upload/v1516015983/mkdkqkiad9es8d8nyfel.jpg"
user_valerie.save

user_admin = User.new(email: 'admin@gmail.com', password: "password", first_name: 'chef', last_name: "admin", admin:'true')
user_admin.remote_photo_url = "http://res.cloudinary.com/ddfczdsao/image/upload/v1516015983/mkdkqkiad9es8d8nyfel.jpg"
user_admin.save
p "users - done"



p "creating 4 categories"

  category_babysitting = Category.new(name: "Babysitting", photo:"http://res.cloudinary.com/ddfczdsao/image/upload/v1516959531/babysitting_zqmnvh.jpg" )
  category_babysitting.save!


  category_soutienscolaire = Category.new(name: "Soutien scolaire", photo: "http://res.cloudinary.com/ddfczdsao/image/upload/v1516959590/books_lwffk9.jpg")
  category_soutienscolaire.save!

  category_coursmusique = Category.new(name: "Cours musique", photo:"http://res.cloudinary.com/ddfczdsao/image/upload/v1516959544/coursmuisuqe25cm_preview_dkkdy8.jpg" )
  category_coursmusique.save!

  category_petsitting = Category.new(name: "Pet Sitting", photo:"http://res.cloudinary.com/ddfczdsao/image/upload/v1516959552/petsitting25cm_preview_hjtdop.jpg" )
  category_petsitting.save!

  category_travaux = Category.new(name: "Travaux")
  category_travaux.save!

  category_divers = Category.new(name: "Divers")
  category_divers.save!

  p "categories - done"

p "creating prestations"
  #url1 = "http://res.cloudinary.com/dfosxgid7/image/upload/v1511969122/zz12gka0dadceixpw0a7.jpg"
  prestation_rachel = Prestation.new(category: category_babysitting, price: "8€/h", description: "J'ai beaucoup d'expérience en babysitting, j'ai gardé de nombreuses fois mes petits cousins. N'hésitez pas à me joindre pour en savoir plus")
  prestation_rachel.user = user_rachel
  prestation_rachel.save!

  prestation_sophie = Prestation.new(category: category_soutienscolaire, price: "15€/h", description: "J'ai beaucoup d'expérience en soutien scolaire, j'ai fait travailler de nombreuses fois mes petits cousins. N'hésitez pas à me joindre pour en savoir plus")
  prestation_sophie.user = user_sophie
  prestation_sophie.save!

  prestation_marie = Prestation.new(category: category_coursmusique, price: "20€/h", description: "J'ai beaucoup d'expérience en cours de piano, j'ai gardé de nombreuses fois mes petits cousins. N'hésitez pas à me joindre pour en savoir plus")
  prestation_marie.user = user_marie
  prestation_marie.save!

  prestation_valerie = Prestation.new(category: category_petsitting, price: "20€/jour", description: "J'ai gardé de nombreuses fois des chiens et chats. N'hésitez pas à me joindre pour en savoir plus")
  prestation_valerie.user = user_valerie
  prestation_valerie.save!

  prestation_marie2 = Prestation.new(category: category_babysitting, price: "8€/h", description: "J'ai beaucoup d'expérience en babysitting, j'ai gardé de nombreuses fois mes petits cousins. N'hésitez pas à me joindre pour en savoir plus")
  prestation_marie2.user = user_marie
  prestation_marie2.save!

  Recomand.new(prestation: prestation_marie, user: user_sophie).save!
  Recomand.new(prestation: prestation_valerie, user: user_sophie).save!
   # p "creating groups"

    group_rachel = user_rachel.groups.first
    group_sophie = user_sophie.groups.first

    p "creating un utilisateur dans le groupe Rachel"

    group_user_sophie = GroupUser.new(group: group_rachel, user: user_sophie, status: 'accepted')
    group_user_sophie.save!

    group_user_rachel = GroupUser.new(group: group_sophie, user: user_rachel, status: 'accepted')
    group_user_rachel.save!
   p"group_user done"


  # p "creating lien entre prestation et groups"

  # group_prestation_rachel = GroupPrestation.new(group: group_rachel, prestation: prestation_rachel)
  # group_prestation_rachel.save!
  # p"group_prestation done"

   p "creating deux posts par rachel"

   post_rachel = Post.new(content: "Qui connaitrait le nom d'un bon plombier. J'ai besoin de changer mon ballon d'eau chaude.merci !", user: user_rachel)
   post_rachel.save!

   post_sophie = Post.new(content: "Help ! ma babysitter m'a plantée. Qui est dsipo pour venir garder mes 2 enfants ce soir à 19h30 ?", user: user_sophie)
   post_sophie.save!
  p"creating 2 posts OK done"



  p"creating 1 events "

event_grafiti = Event.new(name: "Initiation au graffiti", price_cents: "15€", teaser: "Initiez-vous à l'art du graffiti",
  resume: "Plongez pendant 2H dans l'univers du street Art et réalisez votre première création", description: "Une activité originale et inspirante avec notre artiste Boulonnais Mush. Venez vivre une initiation au graffiti en réalisant vous même et à plusieurs une oeuvre en format XXL Lors de cette activité, vous découvrirez les étapes successives à la réalisation d’un graffiti et cela vous permettra de comprendre et d'essayer les différentes techniques utilisées par les graffeurs. Cet expérience d'initiation vous permettra de travailler en équipe et de transformer vos idées sur une réalisation en format XXL dans un climat chaleureux et positif. Mush saura vous accompagner tout au long de cette initiation dans la bonne humeur et vous faire partager sa passion. Une initiation qui vous donnera envie de poursuivre l’aventure et d'admirer dans la ville les différentes réalisations d'art urbain. Vous ne vous promènerez plus jamais dans la ville de la même manière ; Laissez-vous tenter par cet atelier créatif, convivial et inspirant d’une durée de 2h.
", user: user_admin, number_of_participants: "15")
user_rachel.remote_photo_url = "https://res.cloudinary.com/ddfczdsao/image/upload/v1543310688/szxqormyx3etw1cuus7e.jpg"
event_grafiti.save!

  p"creating 1 events OK done"

