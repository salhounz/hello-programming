# Ruby values are objects; local variables do not declare a static type.
owner = 'Ada'
preview_limit = 2
show_completed = false
nickname = nil
puts "Tasks for #{nickname || owner}"

# A method returns its last expression; keyword arguments name options.
def label(title, done: false)
  status = done ? 'done' : 'next'
  "[#{status}] #{title.strip}"
end

# Arrays preserve order; symbols make convenient hash keys.
tasks = [
  { title: 'Read a chapter', done: true },
  { title: 'Water plants', done: false },
  { title: 'Plan a walk', done: false }
]

# A block supplies the operation applied to each element.
tasks.each do |task|
  next if task[:done] && !show_completed

  puts label(task[:title], done: task[:done])
end

pending = tasks.reject { |task| task[:done] }.map { |task| task[:title] }
puts "Preview: #{pending.take(preview_limit).join(', ')}"

# Empty arrays are truthy in Ruby; ask empty? explicitly.
if pending.empty?
  puts 'All caught up'
else
  puts "Remaining tasks: #{pending.length}"
end

tags = %w[home learning home].uniq
puts "Unique tags: #{tags.sort.join(', ')}"
minutes = { reading: 20, walk: 30 }
puts "Missing estimate defaults to #{minutes.fetch(:gardening, 0)}"

# dup copies the array shallowly; its string elements are still shared.
extended = pending.dup
extended << 'Write a note'
puts "Original: #{pending.length}; copy: #{extended.length}"

# Integer rejects malformed text; to_i would silently produce zero here.
begin
  requested = Integer('two')
rescue ArgumentError
  requested = preview_limit
end
puts "Requested preview size: #{requested}"
puts "Nickname length: #{nickname&.length || 0}"
