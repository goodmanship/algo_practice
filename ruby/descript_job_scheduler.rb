class JobScheduler
  attr_accessor :max_jobs_running, :jobs, :running_jobs
  
  def initialize(max_jobs_running=100)
    @max_jobs_running = max_jobs_running
    @jobs = []
    @jobs_running = {}
  end

  def add_new_job job_id, payload
    jobs << [job_id, payload]
    try_dispatch_job(@jobs.shift)
  end

  def job_succeeded(job_id)
    @jobs_running.delete(job_id)
    try_dispatch_job(@jobs.shift)
  end

  def job_failed(job_id)
    if @jobs_running[job_id][:retries] < 3
      try_dispatch_job(job_id, @jobs_running[job_id][:payload])
    else
      max_retries_reached(job_id, @jobs_running[job_id][:payload])
      @jobs_running.delete(job_id)
      try_dispatch_job(@jobs.shift)
    end
  end

  def try_dispatch_job(job_tuple)
    return nil if job_tuple.nil?
    if @jobs_running.keys.length < @max_jobs_running
      dispatch_job(job_tuple[0], job_tuple[1])
      job = {
        payload: job_tuple[1],
        retries: 1
      }
      @jobs_running[job_id] = job
    end
  end

  def dispatch_job(job_id, payload)
    # interface to ther runner
  end

  def max_retries_reached(job_id, payload)
  end
end

require 'test/unit'
class MyTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  def add_new_job_to_zero_queue
    # add_new_job
    # test_jobs_running length
  end

  def add_job_to_full_queue
  end

  def job_succeeded 
end

# /*
# * Async job dispatcher
# * ====================
# *
# * (We are describing this question in Typescript, but feel free to use whatever language, idioms, and programming paradigms you want, such as object-oriented programming, etc.)
# *
# * We want to build a first-in-first-out (FIFO) job dispatcher that takes in jobs via a method call, dispatches a certain number of jobs at a time to some system/object, and buffers excess jobs in-memory until they can be dispatched.
# *
# * Please implement the following functions/methods of the job dispatcher:
# */

# function addNewJob(jobId: string, payload: string): void {
# // Your implementation here
# }

# function jobSucceeded(jobId: string): void {
# // Your implementation here
# }

# function jobFailed(jobId: string): void {
# // Your implementation here
# }

# /*
# * Example usage of the job dispatcher
# *
# * addNewJob('a', 'foo');
# * addNewJob('b', 'bar');
# * jobSucceeded('b');
# * addNewJob('c', 'baz');
# * jobFailed('a');
# * jobFailed('a');/*
# * jobFailed('a'); // 'a' hits maximum retries
# * jobSucceeded('c'); // 'c' is done!
# *
# * There are two helper functions you will need to use:
# */

# function dispatchJob(jobId: string, payload: string): void {
# console.log(`Job ${jobId} dispatched with payload ${payload}`);
# }
# function maxRetriesReached(jobId: string, payload: string): void {
# console.log(`Alert! job ${jobId} failed with payload ${payload}`);
# }
# /*
# * Aside from the interface, the main requirements for are:
# *
# * - In order to start a job running, you must call `dispatchJob`. This job is then considered "running" until `jobSucceeded` or `jobFailed` is called.
# * - Dispatch jobs FIFO as soon as conditions allow for it. This is not a "batch" processing system.
# * - To limit costs, we only want a maximum of 100 jobs to be running at any time.
# * - Some other "worker" system will respond after doing "the job" by calling `jobSucceeded` or `jobFailed` to tell the dispatcher that a job succeeded or failed, respectively, and is no longer running. Don't worry about how exactly the other system calls back to your code.
# * - If `jobSucceeded` is called, discard it and dispatch any next jobs if it is able to.
# * - If `jobFailed` is called, then either:
# * - retry the job immediately (up to a maximum of three total tries);
# * - OR if the job has hit the maximum three tries, call `maxRetriesReached` and then discard the job.
# * - You should write unit tests
# * - The above shouldn't leak memory
# * - You don't need to handle multithreading, multiple processes, or persistance.
# */