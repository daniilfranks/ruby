class Job < Array
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

class SubJob1 < Job
  def initialize
    super('sub job 1')
  end

  def get_time_required
    1.0             # 1 minute to add flour and sugar
  end
end

class SubJob2 < Job

  def initialize
    super('sub job 2')
  end

  def get_time_required
    3.0             # Mix for 3 minutes
  end
end

class CompositeJob < Job
  def initialize(name)
    super(name)
    @sub_jobs = []
  end

  def add_sub_job(job)
    @sub_jobs << job
  end

  def remove_sub_job(job)
    @sub_jobs.delete(job)
  end

  def get_time_required
    time=0.0
    @sub_jobs.each {|job| time += job.get_time_required}
    time
  end
  
  def <<(job)
    @sub_jobs << job
  end
  def [](index)
    @sub_jobs[index]
  end
  def []=(index, new_value)
    @sub_jobs[index] = new_value
  end
  
end



composite = CompositeJob.new('example')
composite << SubJob2.new
puts(composite[0].get_time_required)
composite[1] = SubJob1.new