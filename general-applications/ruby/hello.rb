require "set"
require "stringio"

#
#    Type Systems & Variables
#
# Local variables hold dynamic values; uppercase names conventionally identify constants.
score = 10
score += 5
LANGUAGE = "Ruby".freeze
missing = nil

#
#    Control Flow Operations
#
# if and each express decisions and collection iteration.
status = score >= 10 ? "pass" : "retry"
[1, 2, 3].each { |value| score += value }

#
#    Execution Blocks
#
# Methods and blocks group reusable behavior.
def greet(name = "World")
  "Hello, #{name}!"
end
greeting = greet

#
#    Code Health & Documentation
#
# Use # for notes and =begin/=end at the start of lines for a block comment.
# A single-line comment.
=begin
A multi-line comment at the beginning of the line.
=end
# Return a sum without changing either input.
def add(left, right)
  left + right
end

#
#    Built-In Collections
#
# Array is ordered, Hash maps keys, and Set keeps unique members.
values = [1, 2, 3]
inventory = { apples: 3 }
unique = Set.new([1, 1, 2])
doubled = values.map { |value| value * 2 }

#
#    Data Mutability
#
# dup makes a shallow copy; freeze makes a particular object unmodifiable.
copied = values.dup
copied << 4
settings = { theme: "dark" }.freeze
raise "unexpected mutation" unless values.length == 3

#
#    Access & Encapsulation
#
# Instance variables hold object state; public methods can expose selected operations.
class Counter
  attr_reader :value
  def initialize
    @value = 0
  end
  def increment
    @value += 1
  end
end
counter = Counter.new
counter.increment

#
#    Design Paradigms & Patterns
#
# Enumerable methods and blocks compose transformations.
total = values.reduce(0) { |sum, value| sum + value }
raise "unexpected sum" unless total == 6

#
#    Memory Management
#
# The runtime collects objects; ensure performs cleanup when leaving a protected body.
stream = StringIO.new
begin
  stream.write("sample")
ensure
  stream.close
end

#
#    Concurrency & Parallelism
#
# Thread starts concurrent work; value waits and returns its result.
worker = Thread.new { 42 }
answer = worker.value
raise "unexpected result" unless answer == 42

#
#    Performance Optimization
#
# Use suitable lookup structures and avoid creating intermediate collections unnecessarily.
allowed = Set.new(["Ada", "Grace"])
is_allowed = allowed.include?("Ada")

puts "Hello, World!"
