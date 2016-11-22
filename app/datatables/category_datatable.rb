class CategoryDatatable < AjaxDatatablesRails::Base

  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegators :@view, :link_to, :admin_category_path,
    :edit_admin_category_path
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ["Category.name", "Category.description"]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ["Category.name", "Category.description"]
  end

  private

  def data
    records.map do |record|
      [
        record.name,
        record.description,
        record.products.size,
        link_to('Edit', edit_admin_category_path(record), class: "btn btn-primary"),
        link_to('Delete', admin_category_path(record), class: "btn btn-danger",
          data: {confirm: "Are you sure?"}, method: :delete)
      ]
    end
  end

  def get_raw_records
    Category.all
  end

end
