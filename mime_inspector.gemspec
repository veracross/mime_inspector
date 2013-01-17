Gem::Specification.new do |s|
  s.name        = 'mime_inspector'
  s.version     = '0.5.1'
  s.date        = '2013-01-16'

  s.summary     = "Look at the contents and extension of a file to determine the mime type"
  s.description = "A wrapper around mimemagic that also uses file extension to disamiguate some common formats such as application/zip"

  s.authors     = ['Will Bond']
  s.email       = ['wbond@breuer.com']
  s.homepage    = 'http://github.com/veracross/mime_inspector'
  s.license     = 'MIT'
  
  s.files       = ["lib/mime_inspector.rb"]

  s.add_runtime_dependency 'mimemagic', '>= 0.2.0', '< 1.0'
end