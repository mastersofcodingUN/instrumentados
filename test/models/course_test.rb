# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  reputation  :integer          default(0)
#  difficulty  :string
#  views       :integer          default(0)
#  genre       :string
#  instrument  :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state       :string           default("INACTIVO")
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  test "validacion" do
    @all = Course.getAll
    assert_equal @all.count, 2
  end

  test "val descripcion nombre reputacion" do
    @course2 = Course.new(name: "ABCFGV", description: "asndakjsdnainsdajdsn", difficulty:"Principiante ")
    assert @course2.valid?
    assert @course2.save, "reputación y vistas vienen cero por defecto"
  end

  test "metodo finding" do
    @course = Course.finding(298486374) #prueba de finding sobre los yml
    assert @course.name="MyString"
  end

  test "metodo busqueda" do
    @search = Course.search("MyString", "MyString", "MyString")
    assert_equal @search.count, 2
  end

  test "metodo most_purchased" do
    @purchase = Course.most_purchased
    assert_equal @purchase.count, 2 #verifica que se retornan dos elementos
    assert_equal @purchase[0][1], 3 #retorna el numero mas alto de busquedas
  end

  test "metodo most_viewed" do
    @view = Course.most_viewed
    assert_equal @view.count, 2 #verifica que se retornan dos elementos
    assert_equal @view[0][1], 2 #retorna el numero mas alto de vistas (es decir, 2)
  end
end
