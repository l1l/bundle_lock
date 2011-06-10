module BundleOutdated
  class Searcher
    class GemfileNotFound < StandardError; end

    def search!(version='all',type='all')
      puts "Finding current and outdated gems.."

      unless version == 'new'
        puts "#"*80
        puts "# To Lock Current gem versions in Gemfile: "
        puts "#"*80 
        current_gems.each do |gem|
          puts "  gem '#{gem.name}', '#{gem.version}'"
        end
        puts "#"*80
        puts
        
        unless type == 'gemfile'
          puts "#"*80
          puts "# To Lock Current gem versions for Maven by putting the following in your pom.xml: "
          puts "#"*80
          puts "The following assumes you already use Maven for Gem Dependencies *"
          puts
          xml = Builder::XmlMarkup.new(:target => $stdout, :indent => 2)
          current_gems.each do |gem|
          xml.dependency {
            xml.groupId "rubygems"
            xml.artifactId "#{gem.name}"
            xml.version "#{gem.version}"
            xml.type "gem"
          }
          end
          puts
          puts "*: JRuby Maven Info: https://github.com/mkristian/jruby-maven-plugins/"
          puts "#"*80
        end
        puts
      end
      
      unless outdated_gems.empty? or version == 'current'
        puts "#"*80
        puts "# To Update and Lock New Gems: "
        puts "#"*80
        puts "\nNewer versions found for:"
        outdated_gems.each do |gem|
          puts "  #{gem.name} (#{gem.latest_version} > #{gem.version})"
        end

        puts "\nLock bundle to NEW gem versions by putting the following in your Gemfile:"
        outdated_gems.each do |gem|
          puts "  gem '#{gem.name}', '#{gem.latest_version}'"
        end
        puts "#"*80
        
        unless type == 'gemfile'
          puts "#"*80
          puts "# To Lock NEW gems versions for Maven by putting the following in your pom.xml: "
          puts "#"*80
          puts "The following assumes you already use Maven for Gem Dependencies *"
          puts
          xml = Builder::XmlMarkup.new(:target => $stdout, :indent => 2)
          outdated_gems.each do |gem|
          xml.dependency {
            xml.groupId "rubygems"
            xml.artifactId "#{gem.name}"
            xml.version "#{gem.version}"
            xml.type "gem"
          }
          end
          puts
          puts "*: JRuby Maven Info: https://github.com/mkristian/jruby-maven-plugins/"
          puts "#"*80
        end
      end

      unless handwaving_gems.empty?
        puts "\nYou may try to update non-specific dependencies via:"
        puts "  $ bundle update #{handwaving_gems.collect(&:name).join(' ')}"
        puts "\nHandwaving specifications:"
        handwaving_gems.collect do |g|
          puts "  #{g.name}: #{ [ g.handwaving, g.version ].join(' ') }"
         end
      end
    end

    def current_gems
      @current_gems ||= all_gems.find_all()
    end
    
    def outdated_gems
      @outdated_gems ||= all_gems.find_all(&:outdated?)
    end

    def handwaving_gems
      @handwaving_gems ||= all_gems.find_all(&:handwaving?)
    end

    def gemfile
      unless File.exists?('Gemfile.lock')
        raise GemfileNotFound, 'Gemfile.lock not found! Please re-run in your Ruby project directory.'
      end

      @gemfile ||= File.read('Gemfile.lock').split(/\n/)
    end

    def all_gems
      @all_gems ||= gemfile.grep(/^\s*.+\s\((?![~><=]).+?\)$/).collect do |gem|
        GemDependency.new gem.strip()
      end
    end
  end
end
