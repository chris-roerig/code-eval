def count_locked_locks num_locks, num_passes
  locks = {}

  # set all locks to open
  (1..num_locks).each { |lock| locks[lock] = :open }

  # locks or opens a lock depending on the locks current state
  def flip current
   current == :open ? :locked : :open
  end

  # iterate each of the janitor's hallway passes
  (1..num_passes).each do |pass|
    # update the state of the last lock on the janitor's last pass
    if pass === num_passes 
      locks[num_locks] = flip locks[num_locks] 
      next
    end

    # lock every second lock starting from the first
    locks.each { |lock, lock_state| locks[lock] = :locked if lock % 2 == 0 }

    # reverse every third lock's state
    locks.each do |lock, lock_state|
      locks[lock] = flip lock_state if lock % 3 == 0
    end
  end

  # remove all "open" locks
  locks.keep_if { |lock, lock_state| lock_state === :locked }

  # return the total number of locked locks
  locks.size
end

puts count_locked_locks ARGV[0].to_i, ARGV[1].to_i

# File.open(ARGV[0]).each_line do |line|
#   nums = line.split(' ')
#   puts count_locked_locks nums[0].to_i, nums[1].to_i
# end