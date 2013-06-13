require 'minitest/autorun'
require 'ouch'

class TestOuch < MiniTest::Unit::TestCase
  def setup
    @hospital = Ouch.find(lat: 34.0736204, lng: -118.4003563)
  end

  def test_name
    @hospital.name.must_equal "Cedars-Sinai Medical Center"
  end

  def test_address
    @hospital.address.must_equal "8700 Beverly Boulevard Los Angeles, CA 90048-1865"
  end

  def test_phone
    @hospital.phone.must_equal "310-423-5000"
  end

  def number_of_beds
    @hospital.phone.must_equal 914
  end
end
