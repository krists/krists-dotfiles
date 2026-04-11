require "fileutils"
require "digest"

desc "Installs dotfiles"
task install: [] do
  conflict_suffix = Time.now.to_i
  %w[.gemrc .gitignore .inputrc .irbrc .rdebugrc .rspec .railsrc .tmux.conf .zprofile .zshrc .aliases .gitconfig].each do |file|
    source_path = File.join(Dir.pwd, file)
    target_path = File.join(ENV["HOME"], file)

    if File.symlink?(target_path)
      if File.readlink(target_path) == source_path
        puts "#{target_path} already symlinked correctly, skipping"
        next
      end
      FileUtils.rm(target_path, verbose: true)
    elsif File.exist?(target_path)
      source_hash = Digest::SHA256.file(source_path).hexdigest
      target_hash = Digest::SHA256.file(target_path).hexdigest

      if source_hash == target_hash
        puts "#{target_path} unchanged, skipping"
        next
      end

      FileUtils.mv(target_path, target_path + "_#{conflict_suffix}", verbose: true)
    end

    FileUtils.ln_sf(source_path, target_path, verbose: true)
  end
end
