class OrderDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :admin_order_path
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ["Order.user_id","Order.created_at","Order.address", "Order.total", "Order.status"]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ["Order.user_id","Order.created_at","Order.address", "Order.total", "Order.status"]
  end

  private

  def data
    records.map do |record|
      [
        record.user.name,
        link_to(record.order_details.sum(:quanty), record),
        record.address,
        record.created_at,
        record.total,
        if record.waiting?
          link_to(record.status, admin_order_path(record), method: :put, class: "label label-warning")
        else
          link_to(record.status, admin_order_path(record), method: :put, class: "label label-success")
        end
      ]
    end
  end

  def get_raw_records
    Order.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
