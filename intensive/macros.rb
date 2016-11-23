class Proform
  def self.attributes
    @attributes ||= []
  end

  def self.validations
    @validations ||= {}
  end

  def self.attribute(name)
    attributes << name
  end

  def self.validates(attr, params)
    validations[attr] = params
  end

  attr_reader :model, :errors, :params

  def initialize(model)
    @model = model
    @errors = Hash.new { |h, k| h[k] = [] } 
  end

  def validate(params)
    @params = params.keep_if { |attr| self.class.attributes.include?(attr) }

    self.class.validations.each do |attr, validations|
      validations.each do |type, value|
        if type == :presence && value == true
          errors[attr] << "can't be blank" unless params[attr]
        end
      end  
    end

    valid?
  end

  def valid?
    errors.empty?
  end

  def apply
    return false unless valid?
    return true unless params

    params.each {|attr, val| model.public_send("#{attr}=", val)}
  end
end

class MyForm < Proform
  attribute :title 
  attribute :description

  validates :title, presence: true
end

Product = Struct.new(:title, :description)
p model = Product.new('Ruby blog', 'Description') 

form = MyForm.new(model)
p form.validate(description: 'Test')
p form.errors
p form.apply
p model

form = MyForm.new(model)
p form.validate(title: 'test.ru', description: 'Ruby blog')
p form.valid?
p form.errors
p form.apply
p model