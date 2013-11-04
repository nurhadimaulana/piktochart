class PiktochartGenerator < Rails::Generators::Base
  def create_piktochart_file
    create_file "config/initializers/piktochart.rb", "Konten Piktochart"
  end
end