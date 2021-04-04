class ControlsController < ApplicationController
  def users
    @users = users = User.all.where(deleted_at: nil)
  end
end