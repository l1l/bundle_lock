# bundle\_lock

## Description

We found it difficult to keep Gemfile, Gemfile.lock and if using
Maven pom.xml in sync. This gem strives to make managing this easier.

A simple gem to analyze your `Gemfile` and `Gemfile.lock` to find
the currently locked versions for your app. Provides a list you can
copy and paste to your Gemfile.

Additionally finds out which of the gems in your project have newer 
versions available and thus could potentially be updated.

Includes output for JRuby Maven Plugins to also list Gem dependencies
for both current and new/outdated gems in XML Maven Pom format.
Requires: https://github.com/mkristian/jruby-maven-plugins/

## Installation

    $ gem install bundle_lock

It currently requires RubyGems 1.6.0 or newer, which can be installed/updated with:

    $ gem update --system [version]

(The version argument is not available on really old versions.)

## Usage

From your Ruby project directory or your `Rails.root`:

    $ bundle-lock [[version: current | new], [type: gemfile | maven]]

## Example report

	Finding current gems..
	
	To Lock Current gem versions in Gemfile:
	  gem 'mail', '2.2.18'
      gem 'hoptoad_notifier', '2.3'
      gem 'devise', '1.3.3'
      gem 'oa-oauth', '0.2.4'
      gem 'twitter', '1.4.0'
      gem 'kaminari', '0.12.1'
      gem 'meta_search', '1.0.4'
      gem 'paper_trail', '2'
      gem 'jquery-rails', '0.2.7'
      gem 'guard-rspec', '0.3.0'

    Finding outdated gems..

    Newer versions found for:
      mail (2.3.0 > 2.2.18)
      hoptoad_notifier (2.4.9 > 2.3)
      devise (1.3.4 > 1.3.3)
      oa-oauth (0.2.5 > 0.2.4)
      twitter (1.4.1 > 1.4.0)
      kaminari (0.12.4 > 0.12.1)
      meta_search (1.0.5 > 1.0.4)
      paper_trail (2.2.2 > 2)
      jquery-rails (1.0 > 0.2.7)
      guard-rspec (0.3.1 > 0.3.0)

    Lock bundle to these versions by putting the following in your Gemfile:
      gem 'mail', '2.3.0'
      gem 'hoptoad_notifier', '2.4.9'
      gem 'devise', '1.3.4'
      gem 'oa-oauth', '0.2.5'
      gem 'twitter', '1.4.1'
      gem 'kaminari', '0.12.4'
      gem 'meta_search', '1.0.5'
      gem 'paper_trail', '2.2.2'
      gem 'jquery-rails', '1.0'
      gem 'guard-rspec', '0.3.1'

	Maven Support:
	<dependency>
	  <groupId>rubygems</groupId>
	  <artifactId>mail</artifactId>
	  <version>2.3.0</version>
	  <type>gem</type>
	</dependency>
	<dependency>
	  <groupId>rubygems</groupId>
	  <artifactId>hoptoad_notifier</artifactId>
	  <version>2.4.9</version>
	  <type>gem</type>
	</dependency>
	<dependency>
	  <groupId>rubygems</groupId>
	  <artifactId>devise</artifactId>
	  <version>1.3.4</version>
	  <type>gem</type>
	</dependency>
	<dependency>
	  <groupId>rubygems</groupId>
	  <artifactId>oa-oauth</artifactId>
	  <version>0.2.5</version>
	  <type>gem</type>
	</dependency>
	<dependency>
	  <groupId>rubygems</groupId>
	  <artifactId>twitter</artifactId>
	  <version>1.4.1</version>
	  <type>gem</type>
	</dependency>
	...
	
## License

Released under the MIT License.  See the LICENSE file for further details. 
