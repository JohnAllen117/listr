require_relative 'importer'

class EpisodeImporter < Importer
  def create(attributes)
    category = Category.find_or_initialize_by(:id)
    category.name = attributes.name

    category.save
  end

  private

  def default_options
    { header_converters: :symbol, headers: true, col_sep: ',' }
  end
end
