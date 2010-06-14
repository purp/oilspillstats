# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rscribd}
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Morgan", "Jared Friedman", "Mike Watts"]
  s.date = %q{2010-05-13}
  s.description = %q{The official Ruby gem for the Scribd API. Scribd is a document-sharing website allowing people to upload and view documents online.}
  s.email = %q{api@scribd.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "README",
     "Rakefile",
     "VERSION",
     "lib/rscribd.rb",
     "lib/scribd/api.rb",
     "lib/scribd/category.rb",
     "lib/scribd/collection.rb",
     "lib/scribd/document.rb",
     "lib/scribd/errors.rb",
     "lib/scribd/resource.rb",
     "lib/scribd/security.rb",
     "lib/scribd/user.rb",
     "lib/support/extensions.rb",
     "lib/support/multipart_hack.rb",
     "rscribd.gemspec",
     "sample/01_upload.rb",
     "sample/02_user.rb",
     "sample/test.txt",
     "spec/api_spec.rb",
     "spec/category_spec.rb",
     "spec/collection_spec.rb",
     "spec/document_spec.rb",
     "spec/error_spec.rb",
     "spec/resource_spec.rb",
     "spec/rscribd_spec.rb",
     "spec/security_spec.rb",
     "spec/user_spec.rb"
  ]
  s.homepage = %q{http://www.scribd.com/developers}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rscribd}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Ruby client library for the Scribd API}
  s.test_files = [
    "spec/api_spec.rb",
     "spec/category_spec.rb",
     "spec/collection_spec.rb",
     "spec/document_spec.rb",
     "spec/error_spec.rb",
     "spec/resource_spec.rb",
     "spec/rscribd_spec.rb",
     "spec/security_spec.rb",
     "spec/user_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<mime-types>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
