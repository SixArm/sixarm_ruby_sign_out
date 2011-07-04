# -*- coding: utf-8 -*-

=begin rdoc

= SixArm.com » Ruby » SignOut interface for typical Rails user sign out

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2011 Joel Parker Henderson
License:: See LICENSE.txt file

SignOut is a simple abstract framework for managing a user's web session.

Include this in your application controller, then define concrete methods.

This provides one top-level method:
  sign_out(options=nil) => true for success, false for failure

The top level method will call mid-level methods
that you will define in your own controller.

sign_out calls:
  sign_out_attempt(options=nil), e.g. unset the current user
  sign_out_success(options=nil), e.g. redirect to a goodbye page
  sign_out_failure(options=nil), e.g. flash warning help message


== AuthLogic Example

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

=end

module SignOut


 # The sign_out method calls:
 # - sign_out_attempt
 # - sign_out_success (if sign_out_attempt returns true)
 # - sign_out_failure (if sign_out_attempt returns false or raises a SecurityError)

 def sign_out(options=nil)
  begin
   sign_out_attempt(options) or raise SecurityError
   sign_out_success(options)
   return true
  rescue SecurityError
   sign_out_failure(options)
   return false
  end
 end


 # The sign_out method calls this first.
 #
 # You override this method to e.g.:
 # - prompt the user to save any of his open work
 # - clear the current user variable
 # - clear the current user id in the session
 #
 # If this method succeeds, then control goes to sign_out_success.
 #
 # If this method raises an error, then control goes to sign_out_failure.

 def sign_out_attempt(options=nil)
 end


 # The sign_out method calls this second,
 # iff sign_out_attempt succeeds.
 #
 # You override this method to e.g.:
 # - show the user a flash notice message saying "Goodbye..."
 # - redirect to the application home page

 def sign_out_success(options=nil)
 end


 # The sign_out method calls this second,
 # iff sign_out_attempt raises an exception.
 #
 # You override this method to e.g.:
 # - show the user a flash warning message saying "Problem..."
 # - redirect to a help page with a way to report the problem

 def sign_out_failure(options=nil)
 end

end
