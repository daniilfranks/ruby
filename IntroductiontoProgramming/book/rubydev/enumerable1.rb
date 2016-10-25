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
team.members = ['den','jok','ash']
p team
p team.members
p team.map(&:capitalize)

=begin
Вы вероятно уже знакомы с модулем Enumerable в Ruby, даже если вы видите это название в первый раз. Этот модуль добавляет некоторые методы для массивов, например map, inject, select и т.д. Вы наверняка думаете (Как и я ранее долгое время думал), что эти методы являются методами, подмешиваемыми только к массивам, однако это не так.


Массивы в Ruby используют модуль Enumerable, и вы можете абсолютно так же подмешивать его к любому желаемому классу. Конечно, класс должен представлять собой некую коллекцию, набор элементов, иначе все методы, которые представлены в модуле Enumerable не будут иметь смысла. Давайте рассмотрим пример, в котором у нас имеется класс Team, который управляет командами и членами этих комманд.

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
Enumerable требует использования в контексте вашего класса метода each который передает элементы в коллекцию @members. Все методы из модуля Enumerable полагаются на это. Для примера давайте воспользуемся методом map:

irb(main):001:0> require ‘team.rb’
=> true
irb(main):002:0> team = Team.new
=> #
irb(main):003:0> team.members = ['joshua', 'gabriel', 'jacob']
=> ["joshua", "gabriel", "jacob"]
irb(main):004:0> team.map{|member| member.capitalize}
=> ["Joshua", "Gabriel", "Jacob"]

Теперь мы можем вызывать любой метод из модуля Enumerable как метод экземпляра класса Team и этот метод будет знать, что нам требуется работать внутри с массивом @members. Enumerable может быть мощной примесью к вашим собственным классам. Вы можете даже пойти дальше и сделать вызов метода map более красивым:

team.map(&:capitalize)
=end