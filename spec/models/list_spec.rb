require 'rails_helper'

describe List do
  it { should respond_to(:user)}
  it { should respond_to(:categories)}
  it { should respond_to(:likes)}
end
