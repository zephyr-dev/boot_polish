# BootPolish

[![Build Status](https://travis-ci.org/zephyr-dev/boot_polish.png)](https://travis-ci.org/zephyr-dev/boot_polish)

Boot time introspection to help you get under the heroku 60 second timeout.

## Installation

Add this line to your application's Gemfile:

    gem 'boot_polish'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install boot_polish

## Usage

Add the following line to your 'config/boot.rb' right after the require 'rubygems'

    require 'boot_polish'

I personally wrap it in a guard:

    if ENV["BENCHMARK_REQUIRES"] && ENV["BENCHMARK_REQUIRES"] == 'true'
      require 'boot_polish'
    end

During startup, you'll see all the requires and their associated times.
The default renderer is leaf-first, where the very deepest require is shown first,
with each subsequent outdentation showing the aggregate time for the require and 
its children.

For example:

      0.0020 for require c/4
      0.0187 for require c/3 
      0.0009 for require c/2 
        0.0002 for require c/1/z
      0.0015 for require c/1 
    0.0250 for require c
    0.0002 for require b
    0.0002 for require a 

'a' and 'b' had no children requires
'c' required c/1 (which required c/1/z), c/2, c/3 and c/4

'c' had a time of 0.0250 which was a cumulative of it's time and all it's child requires.

## Todo

 * Make it possible to specify the renderer used by the require_benchmark
 * Introduce some basic network logging (on socket)
 * Introduce basic HTTP logging
 * Introduce a plugin architecture for testing specific hogs (fog, postgress, etc) 
  
