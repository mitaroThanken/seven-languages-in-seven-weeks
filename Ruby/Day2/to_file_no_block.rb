# coding: utf-8

module ToFile
  def filename
    "Object_#{self.object_id}.txt"
  end

  def to_f
    f = File.open(filename, 'w')
    f.write(to_s)
    f.close # クローズを明示
  end
end

class Person
  include ToFile
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

Person.new('mats').to_f

