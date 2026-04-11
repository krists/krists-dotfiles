require "fileutils"
require "digest"

# Maps source path (relative to repo) => target path (relative to $HOME)
DOTFILES = {
  ".aliases" => ".aliases",
  ".config/zed/keymap.json" => ".config/zed/keymap.json",
  ".config/zed/settings.json" => ".config/zed/settings.json",
  ".gemrc" => ".gemrc",
  ".gitconfig" => ".gitconfig",
  ".gitignore" => ".gitignore",
  ".inputrc" => ".inputrc",
  ".irbrc" => ".irbrc",
  ".railsrc" => ".railsrc",
  ".rdebugrc" => ".rdebugrc",
  ".rspec" => ".rspec",
  ".rubocop.yml" => ".rubocop.yml",
  ".tmux.conf" => ".tmux.conf",
  ".zprofile" => ".zprofile",
  ".zshrc" => ".zshrc",
}

desc "Installs dotfiles by creating symlinks"
task install: [] do
  conflict_suffix = Time.now.to_i
  DOTFILES.each do |source_file, target_file|
    source_path = File.join(Dir.pwd, source_file)
    target_path = File.join(ENV["HOME"], target_file)

    if File.symlink?(target_path)
      if File.readlink(target_path) == source_path
        puts "#{target_path} already symlinked correctly, skipping"
        next
      end
      FileUtils.rm(target_path, verbose: true)
    elsif File.exist?(target_path)
      source_hash = Digest::SHA256.file(source_path).hexdigest
      target_hash = Digest::SHA256.file(target_path).hexdigest

      FileUtils.mv(target_path, target_path + "_#{conflict_suffix}", verbose: true) unless source_hash == target_hash
    end

    FileUtils.mkdir_p(File.dirname(target_path))
    FileUtils.ln_sf(source_path, target_path, verbose: true)
  end
end

desc "Uninstalls dotfiles by removing symlinks"
task uninstall: [] do
  DOTFILES.each do |source_file, target_file|
    source_path = File.join(Dir.pwd, source_file)
    target_path = File.join(ENV["HOME"], target_file)

    if File.symlink?(target_path) && File.readlink(target_path) == source_path
      FileUtils.rm(target_path, verbose: true)
    else
      puts "#{target_path} is not a symlink to this dotfiles repo, skipping"
    end
  end
end
