require 'rails/generators/base'

class HvvRubyGenerator < Rails::Generators::NamedBase
  desc "Initialize hvv.rb at config/initializers"

  source_root File.expand_path("../templates", __FILE__)

  def copy_initializer_file
    copy_file "hvv.rb", "config/initializers/hvv_ruby.rb"
  end

end
