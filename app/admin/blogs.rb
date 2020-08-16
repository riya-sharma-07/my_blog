ActiveAdmin.register Blog do
  permit_params :user_id, :category_id, :title, :body, :date, :tags, :image

  index do
    selectable_column
    id_column
    column :user
    column :category
    column :title
    column :date
    column "Image" do |blog|
      image_tag blog.image_url.to_s, style: 'max-width:160px'
    end
    actions
  end

  show do
    attributes_table do
      row :user
      row :category
      row :title
      row :body do |blog|
        blog.body.html_safe
      end
      row :date
      row :tags
      row "Image" do |blog|
        image_tag blog.image_url.to_s
      end
      row :view_count
      row :last_viewed_at
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Blog' do
      f.input :user_id, as: :select, collection: User.all.map{|x| [x.email, x.id]}
      f.input :category_id, as: :select,  collection: Category.all.map{|x| [x.name, x.id]}
      f.input :title
      f.input :body, as: :froala_editor
      f.input :date, as: :datepicker
      f.input :tags, as: :tags
      f.input :image, as: :file
    end
    f.actions
  end
end
