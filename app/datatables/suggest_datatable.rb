class SuggestDatatable < AjaxDatatablesRails::Base

  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegators :@view, :link_to, :admin_suggest_path, :image_tag
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ["Product.name", "Product.price"]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ["Product.name", "Product.price"]
  end

  private

  def data
    records.map do |record|
      [
        record.user.name,
        image_tag(record.image, class: "image"),
        record.name,
        record.category.name,
        record.price,
        record.quanty,
        link_to(record.types, admin_suggest_path(record),
          method: :put,class: "label label-warning")
      ]
    end
  end

  def get_raw_records
    Product.suggest
  end
  # ==== Insert 'presenter'-like methods below if necessary
end
