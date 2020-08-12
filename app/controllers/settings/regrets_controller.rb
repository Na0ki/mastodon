# frozen_string_literal: true

class Settings::RegretsController < Settings::BaseController
  layout 'admin'

  before_action :authenticate_user!
  before_action :require_disabled!

  skip_before_action :require_functional!, only: [:show, :new, :create]

  def show
    @regret = current_user.regret
    redirect_to new_settings_regret_path unless @regret
  end

  def new
    redirect_to settings_regret_path if current_user.regret
    @regret = Regret.new
  end

  def create
    ActiveRecord::Base.transaction do
      @regret = current_user.build_regret(regret_params)
      @regret.save!
      redirect_to root_path, notice: '反省文を送信しました。'
    end
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  private

  def require_disabled!
    forbidden unless current_user&.disabled?
  end

  def regret_params
    params.require(:regret).permit(:body)
  end
end
