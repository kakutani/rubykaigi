class ConfigGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      #m.file "config.yml", "config/config.yml"
      m.template "config.yml.erb", "config/config.yml", :assigns => { :env => get_environments }
      m.file "load_config.rb", "config/initializers/load_config.rb"
      m.readme "INSTALL"
    end
  end

  def get_environments
    YAML.load_file("config/database.yml").keys
  end
end
