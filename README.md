# SixArm.com → Ruby → <br> SignOut abstract interface for apps

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_sign_out.svg)](http://badge.fury.io/rb/sixarm_ruby_sign_out)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_sign_out.png)](https://travis-ci.org/SixArm/sixarm_ruby_sign_out)
[![Code Climate Maintainability](https://api.codeclimate.com/v1/badges/2736098eb76bd5ac39f3/maintainability)](https://codeclimate.com/github/SixArm/sixarm_ruby_sign_out/maintainability)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_sign_out/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_sign_out?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_sign_out>
* Doc: <http://sixarm.com/sixarm_ruby_sign_out/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_sign_out>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [Changes](CHANGES.md), [License](LICENSE.md), [Contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

SignOut is a simple abstract interface for apps.

You can include this module in a Rails application controller,
then your controller can define any of these concrete methods.

For docs go to <http://sixarm.com/sixarm_ruby_sign_out/doc>

Want to help? We're happy to get pull requests.


<!--install-opent-->

## Install

### Gem

Run this command in your shell or terminal:

    gem install sixarm_ruby_sign_out

Or add this to your Gemfile:

    gem 'sixarm_ruby_sign_out'

### Require

To require the gem in your code:

    require 'sixarm_ruby_sign_out'

<!--install-shut-->


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
