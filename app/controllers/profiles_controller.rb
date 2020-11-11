def new
  @profile = current_user.build_profile
end

def create
   @profile = current_user.build_profile(profile_params)
   @profile.assign_attributes(profile_params)
   if @profile.save
     flash[:success] = "名前を登録しました"
     redirect_to tasks_index_path
    else
     flash[:danger] = "名前の登録に失敗しました"
     render :edit
   end
end