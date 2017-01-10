module ExtractAttr
  class InvalidKey < StandardError
  end

  def self.get_id(key)
    invalid_key_d(key)
    key.split(':').last.to_i
  end

  def self.get_home_name(key)
    invalid_key_w(key)
    key.split('-').first
  end

  def self.get_away_name(key)
    invalid_key_w(key)
    key.split('-').last
  end

  protected

  def self.invalid_key_d(key)
  	raise InvalidKey.new, "Invalid key! #{key}" unless key.class == String &&
                                                       /\d+\:\d+\:\d+/ =~ key
  end

  def self.invalid_key_w(key)
  	raise InvalidKey.new, "Invalid key! #{key}" unless key.class == String &&
                                                       /\w+\-\w+/ =~ key
  end
end

p ExtractAttr.get_id('1:2:3')
p ExtractAttr.get_home_name('Danila-Babanov')
p ExtractAttr.get_away_name('Danila-Babanov')

p ExtractAttr.get_id('1:2')
p ExtractAttr.get_home_name('Danila')
p ExtractAttr.get_away_name('Babanov')
