class Names
  def initialize( given, family, nick, pet )
    @given = given
    @family = family
    @nick = nick
    @pet = pet
  end

  def given
    @given
  end

  def family
    @family
  end

  private
    def nick
      @nick
    end

  protected
    def pet
      @pet
    end
end

name = Names.new( "K", "A", "B", "T" )

puts name.given 
puts name.family