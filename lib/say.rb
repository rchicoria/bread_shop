module Say

  # File activerecord/lib/active_record/migration.rb, line 321
  def say(message, subitem=false)
    puts "#{subitem ? "   ->" : "--"} #{message}"
  end

  # File activerecord/lib/active_record/migration.rb, line 325
  def say_with_time(message)
    say(message)
    result = nil
    time = Benchmark.measure { result = yield }
    say "%.4fs" % time.real, :subitem
    say("#{result} rows", :subitem) if result.is_a?(Integer)
    result
  end

end