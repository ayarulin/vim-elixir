require 'spec_helper'

describe "Indenting" do
  specify "'do' indenting" do
    <<-EOF
      do
        something
      end
    EOF
    .should be_elixir_indentation
  end

  it "'do:' on new line indenting" do
    <<-EOF
      def do_something(f),
        do: true
    EOF
    .should be_elixir_indentation
  end

  it "does not consider :end as end" do
    <<-EOF
      defmodule Test do
        def lol do
          IO.inspect :end
        end
      end
    EOF
    .should be_elixir_indentation
  end

  it "does not consider do: as the start of a block" do
    <<-EOF
      def f do
        if true do: 42
      end
    EOF
    .should be_elixir_indentation
  end

end
