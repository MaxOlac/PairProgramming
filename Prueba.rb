require 'faker'
require 'Time'
require 'date'
require 'csv'


class Person
  def initialize(first_name, last_name, email, phone, created_at)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  end
  def to_a
    [@first_name, @last_name, @email, @phone, @created_at]
  end
end
def crea_personas(num)
  arre = []
  for i in 1..num
    arre << Person.new(Faker::Name.first_name,Faker::Name.last_name,Faker::Internet.email,Faker::PhoneNumber.cell_phone, Time.now)
  end
  arre
end
people=crea_personas(10)

class PersonWriter
  attr_accessor :file, :people

  def initialize(txt,arre)
    @file=txt
    @people=arre
  end

  def create_csv
    CSV.open(@file, "wb") do |csv|
    csv << ["first_name", "last_name", "email", "phone", "created_at"]
    end
    @people.each do |this|
      CSV.open(@file, "a+") do |csv|
        csv << this.to_a
      end
    end
  end

  def imprime
    CSV.foreach(@file) do |row|
    p row
    end
  end
end


person_writer = PersonWriter.new("people.csv", people)
person_writer.create_csv
person_writer.imprime



