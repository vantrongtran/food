class UserDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegators :@view, :link_to, :admin_user_path, :image_tag
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ["User.name", "User.email", "User.created_at"]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ["User.name", "User.email","User.created_at"]
  end

  private

  def data
    records.map do |record|
      [
        image_tag(record.avatar, class: "image"),
        record.name,
        record.email,
        record.created_at,
        link_to('Delete', admin_user_path(record), class: "btn btn-danger",data: {confirm: "Are you sure?"}, method: :delete)
      ]
    end
  end

  def get_raw_records
    User.user
  end

  # ==== Insert "presenter"-like methods below if necessary
end
