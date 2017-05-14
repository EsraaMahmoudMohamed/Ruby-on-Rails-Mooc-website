ActiveAdmin.register User do
  permit_params :name, :dob, :picture, :gender, :password, :email

  form do |f|
    f.inputs "New User" do
      f.input :name
      f.input :gender
      f.input :dob
      f.input :picture
      f.input :email
      f.input :password
      f.input :password_confirmation

    end
    f.actions
  end
end
