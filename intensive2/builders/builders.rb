class MyExeption < StandardError; end

class ClassBuilder
  def initialize(filename, class_name)
    @fh = File.open(filename, 'w')
    @fh.write("class #{class_name}\n")
  end

  def create_init_method
    _create_method(name = 'initialize') { "@system = System.new\n" }
  end

  def create_method(name, header = '')
    _create_method(name, header) { "fail NotImplementedError\n" }
  end

  def _create_method(name, header = '')
    @fh.write("def #{header} #{name}\n")
    @fh.write yield if block_given?
    @fh.write("end\n\n")
  end

  def close
    @fh.write("end\n")
    @fh.close
  end

end

class FileBuilder
  attr_reader :class_name, :filename

  def initialize(filename, class_name, model)
    @filename   = filename
    @classe     = ClassBuilder.new(filename, class_name.to_s)
    @model      = model
    @class_name = class_name.to_sym
  end

  def system
    @model.mbt_actions.keys.each do |var| @classe.create_method(var) end
    @classe.close
  end

  def driver
    @classe.create_init_method
    @model.mbt_states.keys.each do |var| @classe.create_method(var, header = 'test_') end
    system
  end
end

class ParseModelFile
  attr_reader :mbt_actions, :mbt_states

  def initialize(filename)
    puts 'Parsing started'
    cntr = 0
    @mbt_states  = Hash.new
    @mbt_actions = Hash.new

    File.foreach(filename) do |row|
      cntr += 1
      next if cntr == 1
      fail MyExeption, "ERROR:INVALID number of actions states" unless row.split(',').size == 3
      state1, action, state2 = row.split(',')
      fail MyExeption, "ERROR:Whitespase in actions/state" if row.split(',').any? do |v| v.include?(' ') end
      @mbt_states[state.chomp]   = 1
      @mbt_states[state2.chomp]  = 1
      @mbt_actions[action.chomp] = 1
    end
  end
end

class VerifyRubyFile
  def initialize(object)
    file_name = object.filename.split('.').first
    require_relative "#{file_name}"
    object.class_name
  end
end

if __FILE__ == $PROGRAM_NAME

  begin
    args = {model: 'test.csv', system_file: 'system_stub.rb',
            driver_file: 'sut_driver_stub.rb'}

    model = ParseModelFile.new(args[:model])

    'Create SUT'
    systeme = FileBuilder.new(args[:system_file], :System, model)
    systeme.system

    'Create SUT-driver'
    driver = FileBuilder.new(args[:driver_file], :SystemDriver, model)
    driver.driver

    'Verify the result'
    VerifyRubyFile.new(systeme)
    VerifyRubyFile.new(driver)

  rescue MyExeption => e
    puts e
  end
end
