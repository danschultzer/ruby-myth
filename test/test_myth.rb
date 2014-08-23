begin
  require 'minitest/autorun'
rescue LoadError
  require 'test/unit'
end

TestCase = if defined? Minitest::Test
    Minitest::Test
  elsif defined? MiniTest::Unit::TestCase
    MiniTest::Unit::TestCase
  else
    Test::Unit::TestCase
  end

require 'myth'
require 'stringio'

if !(version = Gem.loaded_specs['myth-source'].version) or Gem::Version.new(version) >= Gem::Version.new('1.0.0')

class TestMyth < TestCase
  def test_preprocess
    assert_match "a:hover {\n  color: rgb(133, 159, 94);\n}",
      Myth.preprocess(":root {--green: #a6c776;}a:hover {color: color(var(--green) shade(20%));}")
  end

  def test_preprocess_with_io
    io = StringIO.new(":root {--green: #a6c776;}a:hover {color: color(var(--green) shade(20%));}\n")
    assert_match "a:hover {\n  color: rgb(133, 159, 94);\n}",
      Myth.preprocess(io)
  end

  def test_preprocessing_error
    begin
      Myth.preprocess("invalid")
      flunk
    rescue Myth::Error => e
      assert e
    end
  end

  def assert_no_match(expected, actual)
    assert !expected.match(actual)
  end
end

else

class TestMyth < TestCase
  def test_preprocess
    assert_match "\n\na:hover {\n  color: rgb(133, 159, 94);\n}",
      Myth.preprocess(":root {var-green: #a6c776;}a:hover {color: color(var(green) shade(20%));}")
  end

  def test_preprocess_with_io
    io = StringIO.new(":root {var-green: #a6c776;}a:hover {color: color(var(green) shade(20%));}\n")
    assert_match "\n\na:hover {\n  color: rgb(133, 159, 94);\n}",
      Myth.preprocess(io)
  end

  def test_preprocessing_error
    begin
      Myth.preprocess("invalid")
      flunk
    rescue Myth::Error => e
      assert e
    end
  end

  def assert_no_match(expected, actual)
    assert !expected.match(actual)
  end
end

end