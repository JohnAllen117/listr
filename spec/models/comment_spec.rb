require "rails_helper"

describe Comment do
  it { should respond_to(:list) }
  it { should respond_to(:user) }
end
