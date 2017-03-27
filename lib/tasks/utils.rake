namespace :utils do
  desc "Task para popular o banco de dados"
  task seed: :environment do  #environment carrega os models para serem usados aqui

    # criar contatos
    puts "Gerando Contatos (Contacts)..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
        )
    end
    puts "Gerando Contatos (Contacts)...[OK]"

    # criar endereços
    puts "Gerando Endreços (Addresses)..."
    Contact.all.each do |i| # andar pelos contatos cadastrar e adicionar um endereço
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        contact: i
        )
    end
    puts "Gerando Endreços (Addresses)...[OK]"

    # criar contatos
    puts "Gerando Telefones (Phones)..."
    Contact.all.each do |i| # andar pelos contatos cadastrar e adicionar telefone
      Random.rand(1..5).times do |k|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: i
          )
      end
    end
    puts "Gerando Telefones (Phones)...[OK]"

  end

end
