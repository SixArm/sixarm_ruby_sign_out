Gem::Specification.new do |s|

  name                = "sixarm_ruby_sign_out"
  top_files           = [".gemtest","Rakefile","README.rdoc","LICENSE.txt"]
  lib_files           = ["lib/#{name}.rb"]
  test_files          = ["test/#{name}_test.rb"]

  s.name              = NAME
  s.summary           = "SixArm.com » Ruby » Abstract sign out for a typical web app user"
  s.version           = "1.1.4"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true

  s.files             = top_files + lib_files + test_files
  s.test_files        = test_files

end
