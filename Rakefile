require "fileutils"

desc "Ensure that dependencies are installed"
task :ensure_dependencies do
  git_bin_location = `which git`
  if git_bin_location.size > 0
    puts "Found git at: #{git_bin_location}"
    puts "Going to clone brand new Vundle"
    vundle_dir = File.join(Dir.pwd, '.vim', 'bundle', 'vundle')
    FileUtils.rm_rf(vundle_dir, verbose: true)
    puts `git clone https://github.com/gmarik/vundle.git #{vundle_dir}`
  else
    puts "Git can not be found."
    exit
  end
end

desc "Installs dotfiles"
task :install => [:ensure_dependencies] do
  %w(.bash_aliases .bashrc .gemrc .gitignore .inputrc .irbrc .rdebugrc .rspec .vimrc .gvimrc .vim .git-completion.bash .git-prompt.sh).each do |file|
    FileUtils.rm_rf(File.join(ENV["HOME"], file), verbose: true)
    FileUtils.ln_sf(File.join(Dir.pwd, file), File.join(ENV["HOME"], file), verbose: true)
  end
  puts "Done. Now run: vim +BundleInstall"
end