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
  %w(.bash_aliases .bashrc .gemrc .gitignore .inputrc .irbrc .rdebugrc .rspec .vimrc .vim .git-completion.bash .git-prompt.sh).each do |file|
    FileUtils.ln_sf(File.join(Dir.pwd, file), File.join(ENV["HOME"], file), verbose: true)
  end
  puts "Done. Now run: vim +BundleInstall"
end

desc "Install xfce terminal theme"
task :install_term_skin do
  config_path = File.join(ENV["HOME"], '.config', 'xfce4', 'terminal')
  if File.exists?(config_path)
    FileUtils.ln_sf(File.join(Dir.pwd, 'terminalrc'), File.join(config_path, 'terminalrc'), verbose: true)
  else
    puts "Looks like xfce4 is not being used.. Doing nothing!"
  end
end