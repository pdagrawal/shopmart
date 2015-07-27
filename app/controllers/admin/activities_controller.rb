class Admin::ActivitiesController < Admin::BaseController
  before_action :is_admin?
  def index
    @activities = PublicActivity::Activity.order("created_at desc")
  end
end