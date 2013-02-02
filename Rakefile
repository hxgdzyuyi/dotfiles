# This file fork form https://github.com/5long/dotfiles/blob/master/Rakefile

HOME = ENV['HOME']
CWD = File.dirname __FILE__

BLACKLIST = %w[README.markdown Rakefile]
DOTFILES = FileList['*'] - BLACKLIST

DOTFILES.each do |f|
  task f do |t|
    target = "#{HOME}/.#{t.name}"
    source = "#{CWD}/#{t.name}"
    File.symlink source, target unless File.exists? target
  end
end

desc "Take a dotfile from $HOME"
task :take, :dotless_name do |t, args|
  dotless = args[:dotless_name]
  filename = ".#{dotless}"
  full_path = "#{HOME}/#{filename}"
  next unless File.exists? full_path
  if File.symlink? full_path
    puts "#{full_path} is a symlink, not taken."
    next
  end
  mv full_path, dotless
end

desc "Install w/o overwriting"
task :default => (DOTFILES.clone)
