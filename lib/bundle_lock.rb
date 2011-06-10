require 'rubygems'
require 'builder'
require 'bundle_lock/gem_dependency'
require 'bundle_lock/searcher'

module BundleLock
  def self.search!(version='all',type='all')
     Searcher.new.search!(version,type)
  end
end
