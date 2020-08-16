ActiveAdmin.register UserProfile do
  permit_params :name, :user_id, :image, :about_me

  index do
    selectable_column
    id_column
    column :user
    column :name
    column "Image" do |up|
      image_tag up.image_url.to_s, style: 'max-width:160px'
    end
    column :about_me do |up|
      up.about_me.html_safe
    end
    actions
  end

  show do
    attributes_table do
      row :user
      row :name
      row "Image" do |blog|
        image_tag blog.image_url.to_s
      end
      row :about_me do |up|
        up.about_me.html_safe
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'User Profile' do
      f.input :user_id, as: :select, collection: User.all.map{|x| [x.email, x.id]}
      f.input :name
      f.input :image, as: :file
      f.input :about_me, as: :froala_editor
    end
    f.actions
  end
end
