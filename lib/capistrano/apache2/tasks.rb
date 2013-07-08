Capistrano::Configuration.instance.load do
  namespace :apache2 do
    desc "Setup application in apache2"
    task "setup", :role => :web do
      config_file = "config/deploy/apache2_conf.erb"
      unless File.exists?(config_file)
        config_file = File.join(File.dirname(__FILE__), "../../generators/capistrano/apache2/templates/_apache2_conf.erb")
      end
      config = ERB.new(File.read(config_file)).result(binding)
      set :user, sudo_user
      put config, "/tmp/#{application}"
      run "#{sudo} mv /tmp/#{application} /etc/apache2/sites-available/#{application}"
      run "#{sudo} ln -fs /etc/apache2/sites-available/#{application} /etc/apache2/sites-enabled/#{application}"
    end

    desc "Reload apache2 configuration"
    task :reload, :role => :web do
      set :user, sudo_user
      run "#{sudo} /etc/init.d/apache2 reload"
    end
  end
end

