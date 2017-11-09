# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  mail       :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "validaciones" do
    @contact = Contact.new(name: "Nombre común", mail: "jscastelblancoh@unal.edu.co", content: "Correo de prueba para verificar su presencia")
    assert @contact.save
  end
end
