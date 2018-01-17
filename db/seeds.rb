# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Group.destroy_all
Prestation.destroy_all
User.destroy_all

p "creating users"
user_rachel = User.new(email: 'rachel@mail.com', password: "password", first_name: 'Rachel', last_name: "Markle")
user_rachel.remote_photo_url = "http://res.cloudinary.com/ddfczdsao/image/upload/q_auto:low/v1513851194/i7bvn6hhb4ptpvproovl.png"
user_rachel.save

user_sophie = User.new(email: 'sophie@mail.com', password: "password", first_name: 'Sophie', last_name: "Bilbo")
user_sophie.remote_photo_url = "http://res.cloudinary.com/ddfczdsao/image/upload/q_auto:low/v1513795634/hkhutgh1ckkch2mqvi5e.jpg"
user_sophie.save

user_marie = User.new(email: 'marie@mail.com', password: "password", first_name: 'Marie', last_name: "Kenz")
user_marie.remote_photo_url = "http://res.cloudinary.com/ddfczdsao/image/upload/q_auto:low/v1513795634/hkhutgh1ckkch2mqvi5e.jpg"
user_marie.save

user_valerie = User.new(email: 'valerie@mail.com', password: "password", first_name: 'Valerie', last_name: "Doodle")
user_valerie.remote_photo_url = "http://res.cloudinary.com/ddfczdsao/image/upload/v1516015983/mkdkqkiad9es8d8nyfel.jpg"
user_valerie.save


p "users - done"

p "creating prestations"
  #url1 = "http://res.cloudinary.com/dfosxgid7/image/upload/v1511969122/zz12gka0dadceixpw0a7.jpg"
  prestation_rachel = Prestation.new(category: "Babysitting", price: "20€/h", description: "Hello i am an american actress, I am able to be whoever you want me to be wife queen princess lawyer you name it i could be the wife of your dreams so go ahead just book me I'll be the perfect girl for you")
  prestation_rachel.user = user_rachel
  prestation_rachel.save!

  prestation_sophie = Prestation.new(category: "Babysitting", price: "20€/h", description: "Hello i am an american actress, I am able to be whoever you want me to be wife queen princess lawyer you name it i could be the wife of your dreams so go ahead just book me I'll be the perfect girl for you")
  prestation_sophie.user = user_sophie
  prestation_sophie.save!

  prestation_marie = Prestation.new(category: "soutien scolaire", price: "30€/h", description: "Hello i am an american actress, I am able to be whoever you want me to be wife queen princess lawyer you name it i could be the wife of your dreams so go ahead just book me I'll be the perfect girl for you")
  prestation_marie.user = user_marie
  prestation_marie.save!

  prestation_valerie = Prestation.new(category: "soutien scolaire", price: "30€/h", description: "Hello i am an american actress, I am able to be whoever you want me to be wife queen princess lawyer you name it i could be the wife of your dreams so go ahead just book me I'll be the perfect girl for you")
  prestation_valerie.user = user_valerie
  prestation_valerie.save!


  p "creating groups"

    group_rachel = Group.new(title: "Bons plans Rachel")
    group_rachel.save!


  p "creating lien entre user et groups"

  group_user_rachel = GroupUser.new(group: group_rachel, user: user_rachel)
  group_user_rachel.save!
  p"group_user done"


  p "creating lien entre prestation et groups"

  group_prestation_rachel = GroupPrestation.new(group: group_rachel, prestation: prestation_rachel)
  group_prestation_rachel.save!
  p"group_prestation done"


