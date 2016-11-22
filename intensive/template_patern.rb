class User

  attr_reader :first_name, :last_name, :email

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name  = last_name
    @email      = email
  end
end

class FroogleFileGenerator

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def generate
    File.write('froogle.csv', content)
  end

  private

  def header
    "---#{Time.now.strftime("%Y-%m-%-d %H:%M:%S")}---"
  end

  def body
    [user.first_name, user.last_name, user.email].join('|')
  end

  def footer
    '------'
  end

  def content
    [header, body, footer].join("\n")
  end
end

class GamazonFIleGenerator

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def generate
    File.write('gamazon.csv', content)
  end

  private

  def header
    "---#{Time.now.strftime("%Y-%m-%-d %H:%M:%S")}---"
  end

  def body
    ["#{user.first_name}", "#{user.last_name}", user.email].join(',')
  end

  def footer
    '------'
  end

  def content
    [header, body, footer].join("\n")
  end
end

user = User.new('Den', 'Bob', 25)
FroogleFileGenerator.new(user).generate
GamazonFIleGenerator.new(user).generate