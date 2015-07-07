# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start
require "sixarm_ruby_sign_out"

class SignOutTest < Test::Unit::TestCase

 include SignOut

 RIGHT=:foo
 WRONG=:bar

 def setup
  @sign_out_attempt_seen=false
  @sign_out_success_seen=false
  @sign_out_failure_seen=false
 end

 def test_sign_out_right
  x=sign_out(RIGHT)
  assert_equal(true,x,"sign_out x:#{x}")
  assert( @sign_out_attempt_seen,"sign_out_attempt_seen")
  assert( @sign_out_success_seen,"sign_out_success_seen")
  assert(!@sign_out_failure_seen,"sign_out_failure_seen")
 end

 def test_sign_out_wrong
  x=sign_out(WRONG)
  assert_equal(false,x,"sign_out x:#{x}")
  assert( @sign_out_attempt_seen,"sign_out_attempt_seen")
  assert(!@sign_out_success_seen,"sign_out_success_seen")
  assert( @sign_out_failure_seen,"sign_out_failure_seen")
 end

 def sign_out_attempt(options=nil)
  @sign_out_attempt_seen=true
  if options==WRONG then raise SecurityError end
  return options==RIGHT
 end

 def sign_out_success(options=nil)
  @sign_out_success_seen=true
 end

 def sign_out_failure(options=nil)
  @sign_out_failure_seen=true
 end

end
