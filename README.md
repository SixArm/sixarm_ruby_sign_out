# SixArm.com » Ruby » <br> SignOut interface for typical Rails user sign out

* Docs: <http://sixarm.com/sixarm_ruby_sign_out/doc>
* Repo: <http://github.com/sixarm/sixarm_ruby_sign_out>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Sign Out simple abstract framework.

You can include this module in your application controller,
then your controller can define any of these concrete methods. 

For docs go to <http://sixarm.com/sixarm_ruby_sign_out/doc>

Want to help? We're happy to get pull requests.


## Quickstart

Install:

    gem install sixarm_ruby_sign_out

Bundler:

    gem "sixarm_ruby_sign_out", "=1.1.4"

Require:

    require "sixarm_ruby_sign_out"


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
