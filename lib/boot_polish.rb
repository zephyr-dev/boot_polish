require 'boot_polish/base'
require 'boot_polish/nested_benchmark'
require 'boot_polish/default_renderer'

def require(file)
  BootPolish::Base.require_benchmark.nest "require #{file}" do
    super(file)
  end
end

