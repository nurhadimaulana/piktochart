class PiktochartGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    copy_file "piktochart.rb", "config/initializers/piktochart.rb"
  end
end
