# SixArm.com » Ruby » <br> SignOut abstract interface for apps

<!--HEADER-OPEN-->

[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_sign_out.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_sign_out)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_sign_out.png)](https://travis-ci.org/SixArm/sixarm_ruby_sign_out)

* Git: <https://github.com/sixarm/sixarm_ruby_sign_out>
* Doc: <http://sixarm.com/sixarm_ruby_sign_out/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_sign_out>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Changes: See CHANGES.md file.
* License: See LICENSE.md file.
* Helping: See CONTRIBUTING.md file.

<!--HEADER-SHUT-->


## Introduction

SignOut is a simple abstract interface for apps.

You can include this module in a Rails application controller,
then your controller can define any of these concrete methods.

For docs go to <http://sixarm.com/sixarm_ruby_sign_out/doc>

Want to help? We're happy to get pull requests.


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_sign_out", ">= 1.1.5", "< 2"

To install using the command line, run this:

    gem install sixarm_ruby_sign_out -v ">= 1.1.5, < 2"

To install using the command line with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_sign_out -v ">= 1.1.5, < 2" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_sign_out"

<!--INSTALL-SHUT-->


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
