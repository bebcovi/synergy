Synergy.active_admin.post = proc do
  config.sort_order = "created_at_desc"

  decorate_with PostDecorator

  index do
    selectable_column
    column :title_en
    column :title_hr
    column :created_at do |post|
      post.created_at.to_date.to_s(:long)
    end
    default_actions
  end

  form partial: "form"

  show title: ->(post) { post.to_s } do |post|
    attributes_table do
      row :cover_photo do
        image_tag post.cover_photo_url(:small), height: 100 if post.cover_photo?
      end
    end

    %i[en hr].each do |locale|
      h1 { {en: "English", hr: "Croatian"}[locale] }

      attributes_table do
        I18n.with_locale(locale) do
          row :title
          row :body
        end
      end
    end
  end
end
