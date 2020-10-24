def read_own_source
  File.open(__FILE__){|file| file.readlines.each{|line| puts line}}
end

read_own_source
