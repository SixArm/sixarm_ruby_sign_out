# Ruby » <br> SignOut interface for typical Rails user sign out

* Doc: <http://sixarm.com/sixarm_ruby_sign_out/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_sign_out>
* Repo: <http://github.com/sixarm/sixarm_ruby_sign_out>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Sign Out simple abstract framework.

You can include this module in your application controller,
then your controller can define any of these concrete methods. 

For docs go to <http://sixarm.com/sixarm_ruby_sign_out/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_sign_out

Bundler:

    gem "sixarm_ruby_sign_out", "~>1.1.4"

Require:

    require "sixarm_ruby_sign_out"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_sign_out --trust-policy HighSecurity


## Details

This provides one top-level method:

    sign_out(options=nil) => true for success, false for failure

The top level method will call mid-level methods
that you will define in your own controller.

sign_out calls:

    sign_out_attempt(options=nil), e.g. unset the current user
    sign_out_success(options=nil), e.g. redirect to a goodbye page
    sign_out_failure(options=nil), e.g. flash warning help message


## AuthLogic Example

AuthLogic provides this example:

    def destroy
      current_user_session.destroy
     redirect_to new_user_session_url
    end

The same example written using Sign Out to provide better structure and security:
  
    def sign_out_attempt
      current_user_session.destroy
      current_user_session.frozen? or raise SecurityError, "Problem with sign out ... ", caller
    end

    def sign_out_success
      redirect_to new_user_session_url
    end

    def sign_out_failure
      # The AuthLogic example doesn't handle this case unfortunately;
      # we should handle it because it indicates something is amiss.
    end


## Changes

* 2012-03-14 1.1.4 Update docs, tests
* 2010-10-02 1.1.4 Update for Ruby 1.9## License


## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2015 Joel Parker Henderson
