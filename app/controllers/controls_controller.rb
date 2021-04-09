class ControlsController < ApplicationController
def index

end

  def users
    @users = users = User.all.where(deleted_at: nil)
  end
end