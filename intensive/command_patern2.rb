class BaseCommand
  def execute
    raise 'Method execute must be implemented'
  end
end

class AmplifyShieldCommand < BaseCommand
  def execute
    'Amplified Plutonium-Gamma Shield'
  end
end

class CalibrateDriverCommand < BaseCommand
  def execute
    'Calibrate Urbanium-Rod Driver'
  end
end

class TestCompilerCommand < BaseCommand
  def execute
    'Tested Jupiter Wave Compiler'
  end
end

class InstallRegulatorCommand < BaseCommand
  def execute
    'Installed Hydroelecric Magnetosphere Regulator'
  end
end

class Computer
  attr_reader :queue

  def initialize
    @queue = []
  end

  def add(command)
    @queue << command
  end

  def execute
    @queue.inject([]) { |result, command| result << command.execute }.join(' ~ ')
  end
end

class Reactor
  def initialize
    @functional = false
    @right_command = [
                      'Amplified Plutonium-Gamma Shield',
                      'Calibrate Urbanium-Rod Driver',
                      'Tested Jupiter Wave Compiler',
                      'Installed Hydroelecric Magnetosphere Regulator'
                      ].join(' ~ ')
  end

  def fix(result)
    @functional = result == @right_command
  end

  def functional?
    @functional
  end
end

comp = Computer.new
comp.add(AmplifyShieldCommand.new)
comp.add(CalibrateDriverCommand.new)
comp.add(TestCompilerCommand.new)
comp.add(InstallRegulatorCommand.new)

reactor = Reactor.new
reactor.fix(comp.execute)
p reactor.functional?