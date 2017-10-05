class ProfileController < ApplicationController
  before_action :authenticate_user!
  def view_profile
  end
end
