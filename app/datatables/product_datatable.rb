class ProductDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegators :@view, :link_to, :admin_product_path, :image_tag,
    :edit_admin_product_path
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
        image_tag(record.image, class: "image"),
        record.name,
        record.category.name,
        record.price,
        record.quanty,
        link_to('Edit', edit_admin_product_path(record),
          class: "btn btn-primary"),
        link_to('Delete', admin_product_path(record), class: "btn btn-danger",
          data: {confirm: "Are you sure?"}, method: :delete)
      ]
    end
  end

  def get_raw_records
    Product.origin
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
