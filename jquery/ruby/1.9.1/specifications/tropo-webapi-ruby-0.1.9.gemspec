# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tropo-webapi-ruby}
  s.version = "0.1.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Goecke"]
  s.date = %q{2010-05-14}
  s.description = %q{Ruby library for interacting with the Tropo Web API via REST & JSON}
  s.email = %q{jsgoecke@voxeo.com}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".document", ".gitignore", "HISTORY.rdoc", "LICENSE", "README.rdoc", "Rakefile", "VERSION", "examples/sinatra_server.rb", "lib/tropo-webapi-ruby.rb", "lib/tropo-webapi-ruby/object_patch.rb", "lib/tropo-webapi-ruby/tropo-webapi-ruby-helpers.rb", "lib/tropo-webapi-ruby/tropo-webapi-ruby.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/tropo-webapi-ruby_spec.rb", "tropo-webapi-ruby.gemspec"]
  s.homepage = %q{http://tropo.com}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.6")
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Tropo Web API Ruby Gem}
  s.test_files = ["spec/spec_helper.rb", "spec/tropo-webapi-ruby_spec.rb", "examples/sinatra_server.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_runtime_dependency(%q<json_pure>, [">= 1.2.0"])
      s.add_runtime_dependency(%q<hashie>, [">= 0.2.0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<json_pure>, [">= 1.2.0"])
      s.add_dependency(%q<hashie>, [">= 0.2.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<json_pure>, [">= 1.2.0"])
    s.add_dependency(%q<hashie>, [">= 0.2.0"])
  end
end