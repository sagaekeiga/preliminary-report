require "administrate/base_dashboard"

class BotDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::Text,
    url: Field::Text,
    xpath: Field::Text,
    selector: Field::Text,
    date: Field::String,
    call_id: Field::Number,
    pattern: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :url,
    :xpath,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :url,
    :xpath,
    :selector,
    :date,
    :call_id,
    :pattern,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :url,
    :xpath,
    :selector,
    :date,
    :call_id,
    :pattern,
  ].freeze

  # Overwrite this method to customize how bots are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(bot)
  #   "Bot ##{bot.id}"
  # end
end
