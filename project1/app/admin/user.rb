ActiveAdmin.register User do
  permit_params :name, :dob, :picture, :gender, :password, :email
end
