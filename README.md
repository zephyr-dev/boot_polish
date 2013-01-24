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

## Todo

 * Make it possible to specify the renderer used by the require_benchmark
 * Introduce some basic network logging (on socket)
 * Introduce basic HTTP logging
 * Introduce a plugin architecture for testing specific hogs (fog, postgress, etc) 
  
