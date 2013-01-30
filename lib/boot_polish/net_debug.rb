require "net/http"

class Net::HTTP
  class << self
    alias_method :old_new, :new
    def new(*args)
      o = old_new(*args)
      o.set_debug_output(STDOUT)
      o
    end
  end
end
