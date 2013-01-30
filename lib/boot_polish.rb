require 'boot_polish/base'
require 'boot_polish/default_renderer'
require 'boot_polish/nested_benchmark'

def require(file)
  BootPolish::Base.require_benchmark.nest "require #{file}" do
    super(file)
  end
end

