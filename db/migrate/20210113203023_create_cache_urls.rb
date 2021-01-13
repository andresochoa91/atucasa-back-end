class CreateCacheUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :cache_urls do |t|
      t.text :url
      t.text :strData
      t.timestamps
    end
  end
end
