require 'rubygems'
require 'builder'
require 'bundle_outdated/gem_dependency'
require 'bundle_outdated/searcher'

module BundleOutdated
  def self.search!(version='all',type='all')
     Searcher.new.search!(version,type)
  end
end
