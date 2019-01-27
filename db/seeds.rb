# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create instances of each user class [:applicant, :employer, :admin]

# Applicants
User.create([{
  :first_name => "Applicant1",
  :last_name => "Lastname1",
  :email => "applicant1@test.com",
  :password => "password",
  :password_confirmation => "password",
  :role => 0
},
{
  :first_name => "Applicant2",
  :last_name => "Lastname2",
  :email => "applicant2@test.com",
  :password => "password",
  :password_confirmation => "password",
  :role => 0
},
{
  :first_name => "Applicant3",
  :last_name => "Lastname3",
  :email => "applicant3@test.com",
  :password => "password",
  :password_confirmation => "password",
  :role => 0
}])

# Employers
employer1 = User.create({
  :first_name => "Employer1",
  :last_name => "Lastname1",
  :email => "employer1@test.com",
  :password => "password",
  :password_confirmation => "password",
  :role => 1
})

employer2 = User.create({
  :first_name => "Employer2",
  :last_name => "Lastname2",
  :email => "employer2@test.com",
  :password => "password",
  :password_confirmation => "password",
  :role => 1
})

employer3 = User.create({
  :first_name => "Employer1",
  :last_name => "Lastname3",
  :email => "employer3@test.com",
  :password => "password",
  :password_confirmation => "password",
  :role => 1
})

# Administrator
User.create({
  :first_name => "Admin1",
  :last_name => "Lastname1",
  :email => "admin1@test.com",
  :password => "password",
  :password_confirmation => "password",
  :role => 2
})

# Create sample job openings for each of the employers

# Jobs - Employer1
Job.create(
  title: "Customer Service Manager",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. 

    The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  company: "Bamboolean",
  location: "San Francisco",
  company_id: employer1.id
)

Job.create(
  title: "Senior Software Engineer",
  description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.

    All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. 

    The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  company: "Audio League",
  location: "San Francisco",
  company_id: employer1.id
)

Job.create(
  title: "Engineering Manager",
  description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
  company: "LootSuite",
  location: "San Francisco",
  company_id: employer1.id
)

Job.create(
  title: "Program Manager - Mobile",
  description: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
  company: "E-lightful",
  location: "San Francisco",
  company_id: employer1.id
)

# Jobs - Employer2
Job.create(
  title: "Operations Analyst",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  company: "Feenominal",
  location: "San Francisco",
  company_id: employer2.id
)

Job.create(
  title: "IT/DevOps Analyst",
  description: "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. 

    Nulla tempor sem orci, non dapibus nisi feugiat at. Duis faucibus est vitae molestie tristique. Sed a pharetra nisi. Curabitur accumsan lectus non venenatis scelerisque. Maecenas ac laoreet felis. Donec ut semper quam. Proin maximus justo ex, vestibulum viverra est convallis at. Proin euismod nulla nibh, suscipit venenatis neque sodales non. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed ut ipsum auctor, tincidunt nisl a, venenatis ante. Donec sed elit pharetra, placerat lacus sed, finibus augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam semper ut arcu quis placerat.",
  company: "Feenominal",
  location: "Mountain View",
  company_id: employer2.id
)

Job.create(
  title: "Chief of Staff - IT",
  description: "Sed et elit nulla. Donec id semper diam. Quisque congue sapien vel blandit ultricies. Morbi sed porta nunc. Fusce elementum scelerisque ante, a venenatis odio malesuada vel. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut blandit sem nec ipsum porttitor molestie. In hac habitasse platea dictumst. Etiam orci massa, lacinia ut dictum eget, lobortis eget leo. Nullam quis massa semper nisl gravida pellentesque eget at enim. In vulputate blandit mauris, eget tincidunt mi ultricies eleifend. Aliquam ac eleifend magna, at tincidunt nulla. Donec ante tellus, condimentum eu magna quis, bibendum pharetra orci. Nam quis est pulvinar, vestibulum elit ac, sollicitudin mi. Curabitur ut massa sit amet sapien varius malesuada. Donec sed mattis sapien, nec congue nisl.

    Duis nec ex leo. Etiam vitae aliquam libero, ut tincidunt lacus. Sed vitae aliquam erat, vitae interdum ipsum. Donec ornare erat nec dolor viverra, condimentum feugiat leo commodo. Sed consectetur turpis risus, nec tempor sapien tincidunt vitae. Morbi eleifend eros euismod justo luctus posuere. Maecenas vel fringilla eros, nec volutpat neque. Donec vel nulla laoreet, varius erat et, accumsan libero. Phasellus orci dolor, rhoncus sed mauris ac, sagittis eleifend orci. Sed finibus venenatis mi, sed vestibulum erat porttitor at.",
  company: "Feenominal",
  location: "San Mateo",
  company_id: employer2.id
)

Job.create(
  title: "Project Manager",
  description: "Duis non nisi blandit nibh venenatis porta id sit amet eros. Etiam in eleifend augue, et suscipit nibh.

    Phasellus dictum sodales blandit. Sed ac vestibulum erat, eu volutpat magna. Vestibulum nec venenatis lorem, sed malesuada neque. Phasellus finibus fermentum porta. Sed eget nulla nec elit malesuada sollicitudin.",
  company: "Feenominal",
  location: "San Francisco",
  company_id: employer2.id
)

# Jobs - Employer3
Job.create(
  title: "Project Manager",
  description: "Suspendisse facilisis sollicitudin libero, a elementum massa. Vivamus ligula sapien, efficitur eget eros sit amet, rutrum auctor mauris. Donec urna erat, imperdiet ut est eget, euismod rutrum urna. Fusce diam est, volutpat vitae condimentum eu, laoreet eu risus. Vestibulum odio tellus, rhoncus sit amet nunc non, vulputate pharetra enim. Sed commodo sed ipsum vitae volutpat. Curabitur vel nulla varius, vehicula odio in, dictum lorem. Praesent vehicula imperdiet felis quis interdum. Curabitur efficitur sodales lectus, eget faucibus odio sollicitudin in.",
  company: "Facebook II, the Sequel",
  location: "San Francisco",
  company_id: employer3.id
)

Job.create(
  title: "UI/UX Designer",
  description: "Proin lectus mauris, consectetur vitae odio pretium, porta convallis mi. Nunc semper scelerisque augue non sollicitudin. Fusce gravida eros eget rutrum sodales. Suspendisse venenatis luctus nisl, in facilisis sapien. Phasellus arcu enim, placerat commodo iaculis id, laoreet a tortor. Nam rutrum justo id dolor vehicula, eget pretium erat maximus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer molestie nisl vel sagittis porta. In in nulla augue. Vestibulum lacinia dui a libero rutrum viverra.",
  company: "MoneePleez",
  location: "San Francisco",
  company_id: employer3.id
)

Job.create(
  title: "Principal Architect",
  description: "Mauris vel molestie ex, ac convallis lacus. Cras at eros non diam bibendum laoreet eu eget nunc. Donec sit amet dolor vehicula, tempor velit eget, consectetur est. Nullam eu urna lacus. Donec hendrerit finibus augue in molestie. Donec nunc libero, vestibulum sed dapibus et, tristique eget enim. Sed sit amet purus quis purus lobortis euismod nec at leo. Ut cursus justo lorem, sit amet interdum sapien consequat ac.",
  company: "Incredibill",
  location: "San Francisco",
  company_id: employer3.id
)

Job.create(
  title: "Head of Commercial Software",
  description: "In id interdum odio. Ut non erat enim. Pellentesque a odio non ipsum fringilla maximus. Integer sit amet maximus dui, in consectetur lacus. Cras ac tincidunt elit, vitae laoreet erat. Duis vel dolor quis eros accumsan malesuada. Phasellus non volutpat nunc, in semper erat. Donec placerat sem egestas ex tristique iaculis. Aenean feugiat sit amet felis vitae tincidunt.

    Maecenas in lectus felis. Suspendisse eleifend ipsum eget neque suscipit vehicula. Nulla sed lobortis nunc. Mauris at ligula a ex faucibus dictum. Pellentesque in placerat lorem. Fusce tristique venenatis nisi, in ornare dolor finibus non. Duis in tincidunt neque. Vestibulum ac faucibus dolor. Mauris ac eleifend sapien, at venenatis dolor. Aliquam euismod dignissim neque, blandit pellentesque dui tempor nec.",
  company: "Casheteria",
  location: "San Francisco",
  company_id: employer3.id
)
