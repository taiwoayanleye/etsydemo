class UserMailBoxesController < ApplicationController
  before_filter :logged_in_user?,:only => [:new,:create]

  # POST /user_mail_boxes
  # POST /user_mail_boxes.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_letter(user).deliver_now
        format.html { redirect_to(@user, notice: 'User mail box was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
