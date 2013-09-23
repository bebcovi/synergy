Synergy.active_admin.project = proc do
  config.sort_order = "begins_on_desc"
  config.per_page   = 10

  decorate_with ProjectDecorator

  filter :category
  filter :name_en
  filter :name_hr
  filter :description_en
  filter :description_hr

  index do
    selectable_column
    column :name do |project|
      smarty_pants project.name_en
    end
    column :location do |project|
      project.location_en
    end
    column :date
    default_actions
  end

  form partial: "form"

  show title: ->(project) { project.to_s } do |project|
    attributes_table do
      row :category
      row :date
      row :deadline
    end

    locale_attributes :name, :description, :summary, :location,
      :age_restriction, :capacity
  end
end
