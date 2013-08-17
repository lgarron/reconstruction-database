require_relative "spec_helper" 
ReconDatabase::Solve.db = Sequel::Model.db

module ReconDatabase
  describe Solve do

    let(:regular_solve) { Solve.new(time: 10.00) }
    let(:plus_two_solve) { Solve.new(time: 10.00, penalty: "+2") }
    let(:dnf_solve) { Solve.new(time: 10.00, penalty: "dnf") }

    describe "effective value" do
      it "is the time of the solve" do
        regular_solve.effective_value.must_equal 10.00
      end

      it "is the time plus two with a plus two penalty" do
        plus_two_solve.effective_value.must_equal 12.00
      end

      it "is the time for a dnf" do
        dnf_solve.effective_value.must_equal 10.00
      end
    end

    describe "formatting" do
      it "is just the time for no penalty" do
        regular_solve.format.must_equal "10.00"
      end

      it "is the penalty time with a + for a +2" do
        plus_two_solve.format.must_equal "12.00+"
      end

      it "is DNF(<time>) for a dnf" do
        dnf_solve.format.must_equal "DNF(10.00)"
      end
    end

    describe "penalties" do
      it "knows when it is a dnf" do
        dnf_solve.dnf?.must_equal true
        regular_solve.dnf?.must_equal false
      end

      it "knows when it is a +2" do
        plus_two_solve.plus_two?.must_equal true
        regular_solve.plus_two?.must_equal false
      end
    end

    describe "saving" do
      it "saves the added date" do
        Timecop.freeze do
          solve = Solve.new
          solve.save
          solve.date_added.must_be_close_to Time.now
        end
      end
    end
  end
end
