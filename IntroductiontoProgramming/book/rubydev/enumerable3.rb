class Team
	include Enumerable

	attr_accessor :members

	def initialize
		@members = []
	end

	def each &block
		@members.each{ |member| block.call(member) }
	end
end

team = Team.new
team.members = ['den','jok','adrian']
p team.all?{ |member| member.length >= 3 }
p team.all?{ |member| member.length >= 4 }

p team.any?{ |member| member == 'den' }
p team.include?('den')
p team.include?('io')


=begin
Самые основные методы модуля Enumerable это те, которые дают простой ответ да или нет. Существует три таких условных метода: all? , any? и include?. каждый из этих методов предоставляют вам информацию о коллекции с которой вы работаете.
Начнем изучение их работы на основе следущего кода:

class Team
  include Enumerable

  attr_accessor :members

  def initialize
    @members = []
  end

  def each &block
    @members.each{|member| block.call(member)}
  end
end

Метод all?

Этот метод сообщает вам о том, все ли элементы коллекции соответствуют указанному вами критерию. Давайте проверим работу метода all? на практике:

team = Team.new
team.members = ['joshua', 'gabriel', 'jacob']
team.all?{|member| member.length > 4} #=> true
team.all?{|member| member.length > 5} #=> false
Здесь мы проверяем все ли участники (members) обладают именами определенной длины. Все имена имеют более четырех символов, поэтому метод all? вернет значение true. Однако только два из трех имен содержат более пяти символов, благодаря чему во втором случае метод all? вернет значение false.

Независимо от блока, который вы передаете, метод all? будет оценивать каждое значение в коллекции (в нашем случае это массив members) и вернет значение true только в том случае, когда все элементы коллекции соответствуют условию, т.е. возвращают true.

Метод any?

all? слишком строг, требуя соответствие всех элементов условию. Что если нам необходимо знать соответствует ли хотя бы один элемент коллекции условию? Представьте, как Бог в комнате распределения душ спрашивает у отъявленного грешника сделал ли тот хоть один хороший поступок. Грешник вспоминает все свои поступки и ищет хотя бы один хороший. Это очень хорошо иллюстрирует работу метода any?. Но для пущего понимания материала давайте рассмотрим примеры работы метода any? в реальном коде:

require 'team.rb'
team = Team.new
team.members = ['joshua', 'gabriel', 'jacob']
team.any?{|member| member == 'joshua'} #=> true
team.any?{|member| member == 'javier'} #=> false
Пример выше иллюстрирует вечеринку, на которую сходятся все ваши друзья и приглашают своих друзей. В первом случае к вам в звонок звонят трое молодых людей и один из них ваш друг Джошуа, значит остальные двое пришли по его приглашению. У вас есть еще один друг Хавьер, который так же должен был прийти с друзьями. И вот вы слышите звонок, открываете дверь, и перед вами стоит три человека. Поскольку среди них нет вашего друга Хавьера, то эти люди не знакомы вам и сами напрашиваются на вечеринку, следовательно, вы их не пускаете к себе домой. Из примера видно, что метод any? возвращает значение true, если хотя бы один член коллекции соответствует заданному условию.

Метод include?

Это мой любимый условный метод из модуля Enumerable, просто потому, что я всегда забываю как его записывать. Мне всегда хочется написать includes? когда имя коллекции находится в едином числе (например, team). Однако это имеет смысл, когда имя коллекции во множественном числе, как, например в случае с members.include?.
Пример используемый выше (с any?) может быть сокращен благодаря использованию include?:

require 'team.rb'
team = Team.new
team.members = ['joshua', 'gabriel', 'jacob']
team.include?('joshua') #=> true
team.include?('javier') #=> false
В первую очередь обратите внимание и запомните то, что в include? не передается блок, вместо этого include? необходим лишь один параметр — элемент коллекции. Метод include? просматривает всю коллекцию на наличие в ней переданного в качестве аргумента элемента коллекции. В примере выше мы проверяем, есть ли в списке участников, в первом случае, человек по имени Джошуа, а во втором случае, человек по имени Хавьер. Если соответствующий элемент будет найден в коллекции, то метод include? вернет значение true?, в противном случае мы получим значение false.
=end